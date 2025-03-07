import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hour_flow/core/services/data_service.dart';
import 'package:intl/intl.dart';

import '../entites/employee_entity.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addEmployee({required EmployeeEntity employee}) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('employees').doc();

      await docRef.set({
        'id': docRef.id,
        'name': employee.name,
        'job': employee.titleName,
        'daily_salary': employee.salary,
        'borrowed_money': employee.borrowedMoney,
        "total_mins": employee.totalMins,
      });

      print("Employee added successfully!");
    } catch (e) {
      print("Error adding employee: $e");
    }
  }

  Future<void> updateTime(
      {required EmployeeEntity employee,
      required String signIn,
      required String signOut,
      required int total}) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('employees').doc(employee.uid);

      Map<String, dynamic> loanRecord = {
        'Sign In': signIn,
        'Sign Out': signOut,
      };

      await docRef.update({
        'total_mins': FieldValue.increment(total),
        'hour_records': FieldValue.arrayUnion([loanRecord])
      });

      print("UpdateTime updated successfully!");
    } catch (e) {
      print("Error updating UpdateTime money: $e");
    }
  }

  Future<void> borrowedMoney(
      {required EmployeeEntity employee, required double amount}) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('employees').doc(employee.uid);

      String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

      Map<String, dynamic> loanRecord = {
        'date': today,
        'amount': amount,
      };

      await docRef.update({
        'borrowed_money': FieldValue.increment(amount),
        'loan_records': FieldValue.arrayUnion([loanRecord])
      });

      print("Borrowed Money updated successfully!");
    } catch (e) {
      print("Error updating borrowed money: $e");
    }
  }

  Future<List<EmployeeEntity>> getAllEmployees() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('employees').get();

      List<EmployeeEntity> employees = querySnapshot.docs.map((doc) {
        return EmployeeEntity(
            name: doc['name'],
            uid: doc.id,
            titleName: doc['job'],
            salary: (doc['daily_salary'] as num).toDouble(),
            borrowedMoney: doc['borrowed_money'],
            totalMins: doc['total_mins'],
            hourRecord: doc['hour_records'],
            loanRecord: doc['loan_records']);
      }).toList();

      return employees;
    } catch (e) {
      print("Error fetching employees: $e");
      return [];
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

  // Future<List<Map<String, dynamic>>> getAllEmployees() async {
  //   var snapshot =
  //       await FirebaseFirestore.instance.collection('employees').get();

  //   return snapshot.docs.map((doc) {
  //     return doc.data();
  //   }).toList();
  // }

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
