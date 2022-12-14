import 'package:design_pattern/design_pattern/behavioral/template_method/student.dart';

abstract class StudentsBmiCalculator {
  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (var student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }

  // Hook methods
  // Hook methods provide a way to extend behavior of programs at runtime.
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  // Abstract methods
  List<Student> getStudentsData();
}