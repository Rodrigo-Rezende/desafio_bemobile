import 'package:desafio_bemobile/screens/components/list_element.dart';
import 'package:desafio_bemobile/screens/components/list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:desafio_bemobile/controller/main_controller.dart';
import 'package:desafio_bemobile/screens/models/employee.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Employee> employees = [];
  List<Employee> filteredEmployees = [];
  final MainController controller = MainController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await controller.fetchData();
    setState(() {
      employees = data;
      filteredEmployees = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CircleAvatar(
                backgroundColor: Color(0xFFF5F5F5),
                child: Text(
                  "BE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                )),
            leadingWidth: 90,
            actions: [
              Badge.count(
                count: 2,
                backgroundColor: const Color(0xFF0500FF),
                child: SvgPicture.asset('assets/bell_notification.svg'),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25),
              )
            ]),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Funcionários',
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 435,
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (controller
                                  .searchEmployee(employees)
                                  .isNotEmpty) {
                                filteredEmployees =
                                    controller.searchEmployee(employees);
                              } else {
                                filteredEmployees = employees;
                              }
                            });
                          },
                          icon: SvgPicture.asset('assets/search.svg')),
                      Flexible(
                          child: TextField(
                        onChanged: (String value) {
                          setState(() {
                            controller.searchFieldEntry = value;
                            if (controller
                                .searchEmployee(employees)
                                .isNotEmpty) {
                              filteredEmployees =
                                  controller.searchEmployee(employees);
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            color: Color(0xFF1C1C1C),
                          ),
                          hintText: 'Pesquisar',
                          hintStyle: TextStyle(color: Color(0xFF1C1C1C)),
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Flexible(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  const ListHeader(),
                  for (var employee in filteredEmployees)
                    ListElement(
                        id: employee.id,
                        name: employee.name,
                        job: employee.job,
                        admissionDate: employee.admissionDate,
                        phone: employee.phone,
                        image: employee.image)
                ],
              ))
            ],
          ),
        ));
  }
}
