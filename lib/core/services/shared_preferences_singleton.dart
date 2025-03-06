import 'dart:convert';

import 'package:hour_flow/core/entites/employee_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setSelectedEmployee(String employee) async {
    await _instance.setString('employee', employee);
  }

  static getSelectedEmployee() {
    String? employee = _instance.getString('employee');
    if (employee != null) {
      return employee;
    }
    return null;
  }

  Future<void> saveEmployees(List<EmployeeEntity> employees) async {
    List<String> employeeJsonList =
        employees.map((e) => jsonEncode(e.toJson())).toList();

    await _instance.setStringList('employees', employeeJsonList);
  }

  Future<List<EmployeeEntity>> getEmployees() async {
    List<String>? employeeJsonList = _instance.getStringList('employees');

    if (employeeJsonList != null) {
      return employeeJsonList
          .map((e) => EmployeeEntity.fromJson(jsonDecode(e)))
          .toList();
    } else {
      return [];
    }
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key) ?? "";
  }

  static void setDateInt(String key, DateTime date) {
    _instance.setInt(key, date.millisecondsSinceEpoch);
  }

  static DateTime? getDateInt(String key) {
    int? timestamp = _instance.getInt(key);
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static void setDouble(String key, double value) {
    _instance.setDouble(key, value);
  }

  static double getDouble(String key) {
    return _instance.getDouble(key) ?? 0.0;
  }

  static void setMinutes(String key, int minutes) {
    _instance.setInt(key, minutes);
  }

  static int getMinutes(String key) {
    return _instance.getInt(key) ?? 0;
  }
}
