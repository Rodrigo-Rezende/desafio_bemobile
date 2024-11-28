import 'package:desafio_bemobile/screens/components/dashed_divider_widget.dart';
import 'package:desafio_bemobile/service/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ListElement extends StatefulWidget {
  const ListElement(
      {super.key,
      required this.id,
      required this.name,
      required this.job,
      required this.admissionDate,
      required this.phone,
      required this.image});
  final int id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  @override
  State<ListElement> createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  final MainController controller = MainController();

  var isExpanded = false;

  String formatPhoneNumber(String phoneNumber) {
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String formattedNumber = '';
    if (digitsOnly.isNotEmpty) {
      formattedNumber += '+';
    }
    if (digitsOnly.length >= 2) {
      formattedNumber += digitsOnly.substring(0, 2);
    }
    if (digitsOnly.length >= 4) {
      formattedNumber += ' (${digitsOnly.substring(2, 4)})';
    }
    if (digitsOnly.length >= 9) {
      formattedNumber += ' ${digitsOnly.substring(4, 9)}';
    }
    if (digitsOnly.length >= 13) {
      formattedNumber += '-${digitsOnly.substring(9, 13)}';
    }

    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDFDFDF))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: ClipOval(
                          child: DecoratedBox(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child:
                                Image.network(widget.image, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: isExpanded
                              ? SvgPicture.asset(
                                  "assets/charm_chevron-up.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xFF0500FF), BlendMode.srcIn),
                                )
                              : SvgPicture.asset(
                                  "assets/charm_chevron-down.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xFF0500FF), BlendMode.srcIn),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        isExpanded
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDFDFDF))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Cargo"), Text(widget.job)],
                      ),
                      const DashedDividerWidget(color: Color(0xFFDFDFDF),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Data de admissão"),
                          Text(
                            DateFormat('dd/MM/yyyy').format(
                              widget.admissionDate,
                            ),
                          )
                        ],
                      ),
                      const DashedDividerWidget(color: Color(0xFFDFDFDF),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Telefone"),
                          Text(formatPhoneNumber(widget.phone))
                        ],
                      ),
                      const DashedDividerWidget(color: Color(0xFFDFDFDF),),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
