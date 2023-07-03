import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData.dark(),
      home: const BMICalculatorApp(),
    );
  }
}

class BMICalculatorApp extends StatefulWidget {
  const BMICalculatorApp({super.key});

  @override
  _BMICalculator createState() => _BMICalculator();
}

class _BMICalculator extends State<BMICalculatorApp> {
  int height = 100;
  int weight = 65;
  int age = 25;

  String bodyType = "";
  double bmiValue = 0;

  Color maleCardColor = const Color.fromARGB(205, 101, 101, 101);
  Color femaleCardColor = const Color.fromARGB(205, 101, 101, 101);

  Color bmiColor = Colors.green;

  String gender = "male";

  void getBodyType() {
    setState(() {
      bmiValue = (weight / ((height * height) / 10000));
    });

    if (bmiValue < 18.6) {
      setState(() {
        bodyType = "Under Weight";
        bmiColor = Colors.green;
      });
    } else if (bmiValue >= 18.6 && bmiValue < 24.9) {
      setState(() {
        bodyType = "Normal";
        bmiColor = Colors.orange;
      });
    } else {
      setState(() {
        bodyType = "Over Weight";
        bmiColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(205, 47, 47, 47),
      ),
      backgroundColor: const Color.fromARGB(205, 47, 47, 47),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Male and Female cards
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = const Color.fromARGB(205, 72, 68, 68);
                        femaleCardColor =
                            const Color.fromARGB(205, 101, 101, 101);
                        gender = "male";
                      });
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: maleCardColor),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleCardColor = const Color.fromARGB(205, 72, 68, 68);
                        maleCardColor =
                            const Color.fromARGB(205, 101, 101, 101);
                        gender = "female";
                      });
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: femaleCardColor),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // Height box
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(205, 101, 101, 101)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$height cm",
                          style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Slider.adaptive(
                            activeColor: const Color.fromARGB(205, 47, 47, 47),
                            value: height.toDouble(),
                            onChanged: (newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            },
                            min: 100,
                            max: 300,
                            label: "$height",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Weight and Age cards
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Weight card
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromARGB(205, 101, 101, 101)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: const Color.fromARGB(
                                          205, 47, 47, 47)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 25,
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: const Color.fromARGB(
                                          205, 47, 47, 47)),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 25,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Age card
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromARGB(205, 101, 101, 101)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: const Color.fromARGB(
                                          205, 47, 47, 47)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 25,
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: const Color.fromARGB(
                                          205, 47, 47, 47)),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 25,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: GestureDetector(
                onTap: () {
                  getBodyType();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultClass(bmi: bmiValue, bodyType: bodyType, bmiColor: bmiColor)));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 189, 34, 86),
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
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
