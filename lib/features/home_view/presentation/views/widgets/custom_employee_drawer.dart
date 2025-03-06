import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hour_flow/core/entites/employee_entity.dart';
import 'package:hour_flow/core/manager/employee_data_cubit/employee_data_cubit.dart';
import 'add_new_employee.dart';
import 'custom_drawer_employee_list_view.dart';

class CustomEmployeeDrawer extends StatefulWidget {
  const CustomEmployeeDrawer({super.key});

  static const Color primaryColor = Color(0xff131b26);
  static const Color accentColor = Color(0xff1f2a38);
  static const Color iconColor = Colors.white;

  @override
  State<CustomEmployeeDrawer> createState() => _CustomEmployeeDrawerState();
}

class _CustomEmployeeDrawerState extends State<CustomEmployeeDrawer> {
  List<EmployeeEntity> employees = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomEmployeeDrawer.primaryColor,
              CustomEmployeeDrawer.accentColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: CustomEmployeeDrawer.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  BlocBuilder<EmployeeDataCubit, EmployeeDataState>(
                      builder: (context, state) {
                    return Text(
                      context.read<EmployeeDataCubit>().selectedEmployee.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              title: Text('إضافة موظف جديد'),
              onTap: () {
                Navigator.pop(context);
                showAddNewEmployeeSheet(context);
              },
            ),
            Expanded(
              child: BlocConsumer<EmployeeDataCubit, EmployeeDataState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomEmployeeDrawerListView(
                      employees: BlocProvider.of<EmployeeDataCubit>(context)
                          .employees);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
