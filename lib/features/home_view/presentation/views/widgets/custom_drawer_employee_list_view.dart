import 'package:flutter/material.dart';
import 'package:hour_flow/core/entites/employee_entity.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/custom_employee_drawer_item.dart';

class CustomEmployeeDrawerListView extends StatelessWidget {
  const CustomEmployeeDrawerListView({
    super.key,
    required this.employees,
  });

  final List<EmployeeEntity> employees;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return CustomEmployeeDrawerItem(
          employee: employees[index],
        );
      },
    );
  }
}
