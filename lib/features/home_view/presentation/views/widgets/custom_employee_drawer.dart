import 'package:flutter/material.dart';
import '../../../../../core/models/employee_model.dart';
import 'add_new_employee.dart';
import 'custom_drawer_employee_list_view.dart';

class CustomEmployeeDrawer extends StatelessWidget {
  const CustomEmployeeDrawer({super.key});

  static const Color primaryColor = Color(0xff131b26);
  static const Color accentColor = Color(0xff1f2a38);
  static const Color iconColor = Colors.white;
  static const List<EmployeeModel> employees = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, accentColor],
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
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "أبو احمد الجامد",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
              child: CustomEmployeeDrawerListView(employees: employees),
            ),
          ],
        ),
      ),
    );
  }
}
