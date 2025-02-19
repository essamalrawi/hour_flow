import 'package:flutter/material.dart';

import '../../../../../core/models/employee_model.dart';

class FancyEmployeeCard extends StatelessWidget {
  final EmployeeModel employee;

  const FancyEmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1B232E),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.account_circle, color: Colors.white),
          ),
          title: Text(
            employee.name,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(employee.position),
        ),
      ),
    );
  }
}
