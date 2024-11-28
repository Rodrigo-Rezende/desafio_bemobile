import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 47,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFEDEFFB),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            border: Border.all(color: const Color(0xFFDFDFDF))),
        child: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text("Foto"),
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  "Nome",
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset("assets/Circle.svg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
