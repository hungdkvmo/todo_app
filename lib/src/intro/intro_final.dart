import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroFinal extends StatelessWidget {
  const IntroFinal({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0XFF121212),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 42,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/icons/checked.svg',
            width: 113,
            height: 113,
          ),
          Flexible(
            child: Column(
              children: const [
                Text(
                  'Welcome to UpTodo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Flexible(
                  flex: 5,
                  child: Text(
                    'Please login to your account or create new account to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.67),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 191,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8875FF),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      'login'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(
                      width: 2.0,
                      color: Color(0xFF8875FF),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Create account'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
