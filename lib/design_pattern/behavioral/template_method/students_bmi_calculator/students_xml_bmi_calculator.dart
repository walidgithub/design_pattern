import '../api/xml_students_api.dart';
import '../student.dart';
import '../students_bmi_calculator.dart';

class StudentsXmlBmiCalculator extends StudentsBmiCalculator {
  final XmlStudentsApi _api = XmlStudentsApi();

  get xml => null;

  @override
  List<Student> getStudentsData() {
    var studentsXml = _api.getStudentsXml();
    var xmlDocument = xml.parse(studentsXml);
    var studentsList = List<Student>();

    for (var xmlElement in xmlDocument.findAllElements('student')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var age = int.parse(xmlElement.findElements('age').single.text);
      var height = double.parse(xmlElement.findElements('height').single.text);
      var weight = int.parse(xmlElement.findElements('weight').single.text);

      studentsList.add(Student(
        fullName: fullName,
        age: age,
        height: height,
        weight: weight,
      ));
    }

    return studentsList;
  }
}