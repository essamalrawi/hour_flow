import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hour_flow/core/entites/employee_entity.dart';

import '../../../../../core/manager/employee_data_cubit/employee_data_cubit.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';

class CustomEmployeeDrawerItem extends StatelessWidget {
  const CustomEmployeeDrawerItem({
    super.key,
    required this.employee,
  });

  final EmployeeEntity employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
      },
      child: MouseRegion(
        onEnter: (_) => _onHover(context, true),
        onExit: (_) => _onHover(context, false),
        child: GestureDetector(
          onTap: () {
            context
                .read<EmployeeDataCubit>()
                .setSelectedEmployee(selecEmp: employee);

            Scaffold.of(context).closeDrawer();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  employee.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  employee.titleName,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                tileColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(BuildContext context, bool isHovered) {}
}
