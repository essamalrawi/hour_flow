import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hour_flow/core/services/data_service.dart';

import '../models/employee_model.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addEmployee({required EmployeeModel employee}) async {
    try {
      await FirebaseFirestore.instance.collection('employees').add({
        'name': employee.name,
        'job': employee.position,
        'daily_salary': employee.dailySalary,
      });
      print("Employee added successfully!");
    } catch (e) {
      print("Error adding employee: $e");
    }
  }

  void recordAttendance(
      String employeeId, DateTime checkInTime, DateTime checkOut) async {
    await FirebaseFirestore.instance
        .collection('employees')
        .doc(employeeId)
        .collection('attendance')
        .add({
      'check_in': checkInTime.toIso8601String(),
      'check_out': checkOut.toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getAllEmployees() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('employees').get();

    return snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? docuementId,
      Map<String, dynamic>? query}) async {
    if (docuementId != null) {
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
