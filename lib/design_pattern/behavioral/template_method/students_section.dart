import 'package:design_pattern/design_pattern/behavioral/template_method/student.dart';
import 'package:design_pattern/design_pattern/behavioral/template_method/students_bmi_calculator.dart';
import 'package:flutter/material.dart';

class StudentsSection extends StatefulWidget {
  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection({
    required this.bmiCalculator,
    required this.headerText,
  })  : assert(bmiCalculator != null),
        assert(headerText != null);

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = List<Student>();

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}