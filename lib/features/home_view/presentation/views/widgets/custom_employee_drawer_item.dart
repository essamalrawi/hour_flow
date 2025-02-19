import 'package:flutter/material.dart';
import 'package:hour_flow/core/models/employee_model.dart';

class CustomEmployeeDrawerItem extends StatelessWidget {
  const CustomEmployeeDrawerItem({
    super.key,
    required this.employee,
  });

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
      },
      child: MouseRegion(
        onEnter: (_) => _onHover(context, true),
        onExit: (_) => _onHover(context, false),
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
                employee.position,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              tileColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(BuildContext context, bool isHovered) {}
}
