import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hour_flow/core/utils/app_colors.dart';

void showEmployeeSelectionSheet(BuildContext context) {
  List<String> employees = [
    "محمد",
    "أحمد",
    "خالد",
    "سارة",
    "محمد",
    "أحمد",
    "خالد",
    "سارة",
    "سارة",
    "سارة",
  ];
  Color mainColor = AppColors.primaryColor;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double maxHeight = constraints.maxHeight * 0.8;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: maxHeight,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "اختر الموظف",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ...employees.map((employee) {
                            return GestureDetector(
                              onTap: () {
                                print("تم اختيار الموظف: $employee");
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 1),
                                ),
                                child: Center(
                                  child: Text(
                                    employee,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white70),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.9),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 40),
                            ),
                            child: Text("إغلاق"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
