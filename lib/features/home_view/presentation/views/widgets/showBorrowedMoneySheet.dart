import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hour_flow/core/manager/employee_data_cubit/employee_data_cubit.dart';

void showBorrowMoneySheet(BuildContext context) {
  double deposit = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff131b26).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Builder(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "إضافة مبلغ مقترض",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          onChanged: (val) {
                            deposit = double.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                                FontAwesomeIcons.moneyBillWave,
                                color: Colors.white70),
                            hintText: "أدخل المبلغ بالجنيه",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (deposit != 0) {
                              BlocProvider.of<EmployeeDataCubit>(context)
                                  .borrowedMoney(money: deposit);
                            }

                            Navigator.pop(context);
                          },
                          icon: const Icon(FontAwesomeIcons.check, size: 18),
                          label: const Text("حفظ"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade700,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
