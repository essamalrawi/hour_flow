import 'package:flutter/material.dart';
import '../../../../../core/models/employee_model.dart';
import 'add_new_employee.dart';
import 'custom_drawer_employee_list_view.dart';

class CustomEmployeeDrawer extends StatelessWidget {
  const CustomEmployeeDrawer({super.key});

  static const Color primaryColor = Color(0xff131b26);
  static const Color accentColor = Color(0xff1f2a38);
  static const Color iconColor = Colors.white;
  static const List<EmployeeModel> employees = [
    EmployeeModel(name: "أبو أحمد الجامد", position: "سباك"),
    EmployeeModel(name: "محمد جاسم البطل", position: "مزارع"),
    EmployeeModel(name: "حسان سعيد الفاهم", position: "نجار"),
    EmployeeModel(name: "خالد الشجاع", position: "حداد"),
    EmployeeModel(name: "خالد فهد الصادق", position: "طبيب بيطرى"),
    EmployeeModel(name: "علي حسن القوي", position: "سائق توك توك"),
    EmployeeModel(name: "محمود عادل الشاطر", position: "مصور"),
    EmployeeModel(name: "سعيد كامل الأمل", position: "محاسب"),
    EmployeeModel(name: "أحمد يوسف القوي", position: "مهندس ميكانيكا"),
    EmployeeModel(name: "عادل محمود الجاد", position: "فني كهرباء"),
    EmployeeModel(name: "عمر سامي الضحوك", position: "موظف استقبال"),
    EmployeeModel(name: "فؤاد عبد الله القوي", position: "فنان"),
    EmployeeModel(name: "أسامة أحمد السريع", position: "شيف"),
    EmployeeModel(name: "عماد طارق المجتهد", position: "مدير مشروع"),
    EmployeeModel(name: "حسن فوزي المحترف", position: "مطور برمجيات"),
    EmployeeModel(name: "أحمد سعيد الحذر", position: "حلاق"),
    EmployeeModel(name: "طارق عبد الله النشيط", position: "مترجم"),
    EmployeeModel(name: "زكريا محمود النشيط", position: "مدرس"),
    EmployeeModel(name: "مصطفى جمال القوي", position: "موظف حكومي"),
  ];

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
