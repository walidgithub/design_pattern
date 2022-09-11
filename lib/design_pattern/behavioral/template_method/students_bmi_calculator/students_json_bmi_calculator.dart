import 'dart:convert';

import '../api/json_student_api.dart';
import '../student.dart';
import '../students_bmi_calculator.dart';

class StudentsJsonBmiCalculator extends StudentsBmiCalculator {
  final JsonStudentsApi _api = JsonStudentsApi();

  @override
  List<Student> getStudentsData() {
    var studentsJson = _api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList
        .map((json) => Student(
      fullName: json['fullName'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
    ))
        .toList();

    return studentsList;
  }
}