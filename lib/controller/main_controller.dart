import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:desafio_bemobile/screens/models/employee.dart';

class MainController {
  var searchFieldEntry = "";

  List<Employee> searchEmployee(List employees) {
    List<Employee> filteredList = [];
    for (var employee in employees) {
      if (employee.name
              .toLowerCase()
              .contains(searchFieldEntry.toLowerCase()) ||
          employee.job.toLowerCase().contains(searchFieldEntry.toLowerCase()) ||
          employee.phone.contains(searchFieldEntry)) {
        filteredList.add(employee);
      }
    }
    return filteredList;
  }

  Future<List<Employee>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/employees'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> employeesJson = data ?? [];
        return parseEmployees(employeesJson);
      } else {
        throw Exception(
            "Failed to load employees, status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching employees: $e");
    }
  }
}
