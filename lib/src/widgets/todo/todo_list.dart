import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});
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
            'assets/images/blank_item.svg',
            width: 227,
            height: 227,
          ),
          const Text(
            'What do you want to do today?',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.87),
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Tap + to add your tasks',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.87),
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
