class Employee {
  final int id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  Employee({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      job: json['job'] as String,
      admissionDate: DateTime.parse(json['admission_date'] as String),
      phone: json['phone'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'admission_date': admissionDate.toIso8601String(),
      'phone': phone,
      'image': image,
    };
  }
}

List<Employee> parseEmployees(List<dynamic> jsonList) {
  return jsonList.map((json) => Employee.fromJson(json)).toList();
}