class EmployeeEntity {
  final String name;
  final String titleName;
  final double salary;
  final String? uid;
  double borrowedMoney;
  int totalMins;
  Map<String, String>? loanRecord;
  Map<String, String>? hourRecord;
  EmployeeEntity(
      {required this.borrowedMoney,
      required this.totalMins,
      required this.uid,
      required this.name,
      required this.titleName,
      required this.salary,
      required this.loanRecord,
      required this.hourRecord});

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'name': name,
      'job': titleName,
      'daily_salary': salary,
      'borrowed_money': borrowedMoney,
      'total_mins': totalMins,
      'hour_records': hourRecord,
      'loan_records': loanRecord
    };
  }

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {
    return EmployeeEntity(
        uid: json['id'],
        name: json['name'],
        titleName: json['job'],
        salary: json['daily_salary'],
        borrowedMoney: json['borrowed_money'],
        totalMins: json['total_mins'],
        loanRecord: json['loan_records'],
        hourRecord: json['hour_records']);
  }

  factory EmployeeEntity.empty() {
    return EmployeeEntity(
        uid: null,
        name: 'غير محدد',
        titleName: '??',
        salary: 0.0,
        borrowedMoney: 0,
        totalMins: 0,
        loanRecord: {},
        hourRecord: {});
  }
}
