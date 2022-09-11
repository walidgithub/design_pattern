import 'package:design_pattern/design_pattern/behavioral/template_method/students_bmi_calculator/students_json_bmi_calculator.dart';
import 'package:design_pattern/design_pattern/behavioral/template_method/students_bmi_calculator/students_xml_bmi_calculator.dart';
import 'package:design_pattern/design_pattern/behavioral/template_method/students_bmi_calculator/teenage_students_json_bmi_calculator.dart';
import 'package:design_pattern/design_pattern/behavioral/template_method/students_section.dart';
import 'package:flutter/material.dart';

class TemplateMethodExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StudentsSection(
              bmiCalculator: StudentsXmlBmiCalculator(),
              headerText: 'Students from XML data source:',
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            StudentsSection(
              bmiCalculator: StudentsJsonBmiCalculator(),
              headerText: 'Students from JSON data source:',
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            StudentsSection(
              bmiCalculator: TeenageStudentsJsonBmiCalculator(),
              headerText: 'Students from JSON data source (teenagers only):',
            ),
          ],
        ),
      ),
    );
  }
}