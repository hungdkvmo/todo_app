import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepItem {
  String imageUrl = '';
  String title = '';
  String subTitle = '';

  StepItem({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
}

class IntroStepItem extends StatefulWidget {
  String indicator = 'center';
  StepItem stepObject;
  int currentStep = 0;
  int size = 3;

  IntroStepItem(
      {super.key,
      required this.stepObject,
      required this.currentStep,
      required this.size});
  @override
  State<IntroStepItem> createState() => _IntroStepItemState();
}

class _IntroStepItemState extends State<IntroStepItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFF121212),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SvgPicture.asset(
              widget.stepObject.imageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 38),
            child: Wrap(
              spacing: 8,
              children: <Widget>[
                for (int i = 0; i < widget.size; i++)
                  Container(
                    width: 27,
                    height: 4,
                    decoration: BoxDecoration(
                      color: widget.currentStep == i
                          ? Colors.white
                          : const Color(0XFFAFAFAF),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 38),
            child: Text(
              widget.stepObject.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 38),
            child: Flexible(
              child: Text(
                widget.stepObject.subTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
