import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroStart extends StatelessWidget {
  const IntroStart({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0XFF121212),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/icons/checked.svg',
            width: 113,
            height: 113,
          ),
          const Text(
            'UpTodo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}
