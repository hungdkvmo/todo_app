import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Focuse extends StatelessWidget {
  const Focuse({super.key});
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
        children: const [
          Text(
            'Focuse',
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
