import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultClass extends StatelessWidget {
  double bmi;
  String bodyType;

  ResultClass({super.key, required this.bmi, required this.bodyType});

  @override
  Widget build(BuildContext context) {
    String bmiValue = bmi.toStringAsFixed(2);

    return Scaffold(
      backgroundColor: const Color.fromARGB(205, 47, 47, 47),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Your result",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.51,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(205, 47, 47, 47),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bodyType,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        bmiValue,
                        style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 189, 34, 86),
                  ),
                  child: Center(
                    child: Text(
                      "Re-Calculate",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
