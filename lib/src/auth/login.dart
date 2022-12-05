import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isFilledEmail = false;
  bool _isFilledPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        backgroundColor: const Color(0XFF121212),
        toolbarHeight: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 222, 214, 214),
          color: Color(0XFF121212),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 40,
              margin: const EdgeInsets.only(
                bottom: 40,
              ),
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/arrow_left.svg',
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // need to route login page
                },
              ),
            ),
            Flexible(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Username:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Enter your Username',
                              helperStyle: TextStyle(
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Color(0XFF1D1D1D),
                              contentPadding: EdgeInsets.all(11),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Color(0XFF979797),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Color(0XFF979797),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  _isFilledEmail = false;
                                });
                              } else {
                                setState(() {
                                  _isFilledEmail = true;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Password:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              helperStyle: TextStyle(
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Color(0XFF1D1D1D),
                              contentPadding: EdgeInsets.all(11),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Color(0XFF979797),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Color(0XFF979797),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  _isFilledPassword = false;
                                });
                              } else {
                                setState(() {
                                  _isFilledPassword = true;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF8687E7),
                          disabledBackgroundColor:
                              const Color.fromRGBO(134, 135, 231, 0.5),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: (_isFilledEmail && _isFilledPassword)
                            ? () {
                                Navigator.pop(context);
                              }
                            : null,
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
