import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'intro_step_item.dart';
import 'intro_start.dart';
import 'intro_final.dart';

class Intro extends StatefulWidget {
  Intro({super.key});
  List<StepItem> steps = [
    StepItem(
      imageUrl: 'assets/images/step1.svg',
      title: 'Manage your tasks',
      subTitle:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    StepItem(
      imageUrl: 'assets/images/step2.svg',
      title: 'Create daily routine',
      subTitle:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    StepItem(
      imageUrl: 'assets/images/step3.svg',
      title: 'Orgonaize your tasks',
      subTitle:
          'You can organize your daily tasks by adding your tasks into separate categories',
    ),
  ];
  List<StepItem> initValue = [];
  // int currentStep = 3;
  int currentStep = -1;

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Intro'),
        backgroundColor: const Color(0XFF121212),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Center(
        child: (widget.currentStep == -1)
            ? Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      child: const IntroStart(),
                      onTap: () {
                        setState(() {
                          widget.currentStep += 1;
                        });
                        // need to route login page
                      },
                    ),
                  ),
                ],
              )
            : (widget.currentStep < widget.steps.length)
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        decoration:
                            const BoxDecoration(color: Color(0XFF121212)),
                        height: 70,
                        child: Row(children: [
                          GestureDetector(
                            child: const Text(
                              'SKIP',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(255, 255, 255, 0.44),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/home');
                              // need to route login page
                            },
                          ),
                        ]),
                      ),
                      Flexible(
                        flex: 5,
                        child: (widget.currentStep == -1)
                            ? const IntroStart()
                            : IntroStepItem(
                                stepObject: widget.steps[widget.currentStep],
                                currentStep: widget.currentStep,
                                size: widget.steps.length,
                              ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFF121212),
                        ),
                        padding: const EdgeInsets.only(right: 24),
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 48,
                              child: TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: const Text(
                                  'BACK',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(255, 255, 255, 0.44),
                                  ),
                                ),
                                onPressed: () {
                                  if (widget.currentStep > -1) {
                                    setState(() {
                                      widget.currentStep -= 1;
                                    });
                                  } else {
                                    setState(() {
                                      widget.currentStep = -1;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8875FF),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                onPressed: () {
                                  int lastStep = 0;
                                  lastStep = widget.steps.length;
                                  if (widget.currentStep < lastStep) {
                                    setState(() {
                                      widget.currentStep += 1;
                                    });
                                  } else {
                                    setState(() {
                                      widget.currentStep = lastStep;
                                    });
                                  }
                                },
                                child: Text(
                                  (widget.currentStep < widget.steps.length - 1)
                                      ? 'NEXT'.toUpperCase()
                                      : 'Get Started'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        decoration:
                            const BoxDecoration(color: Color(0XFF121212)),
                        height: 70,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: SvgPicture.asset(
                                'assets/icons/arrow_left.svg',
                                width: 24,
                                height: 24,
                              ),
                              onTap: () {
                                setState(() {
                                  widget.currentStep -= 1;
                                });
                                // need to route login page
                              },
                            ),
                          ],
                        ),
                      ),
                      const Flexible(
                        flex: 5,
                        child: IntroFinal(),
                      ),
                    ],
                  ),
      ),
    );
  }
}
