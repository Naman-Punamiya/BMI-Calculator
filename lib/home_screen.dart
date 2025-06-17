import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightSlider = 140;
  int age = 20;
  int weight = 50;

  Color maleColour = Colors.white60;
  Color femaleColour = Colors.white60;

  void selectGender(bool gender) {
    if (gender) {
      setState(() {
        maleColour = Color(0xffDBEEFF);
        femaleColour = Colors.white;
      });
    } else {
      setState(() {
        maleColour = Colors.white;
        femaleColour = Color(0xffFBDDDB);
      });
    }
  }

  void addSubAge(bool ageadd) {
    if (ageadd) {
      setState(() {
        age += 1;
      });
    } else {
      setState(() {
        age -= 1;
      });
    }
  }

  void addSubWeight(bool weightadd) {
    if (weightadd) {
      setState(() {
        weight += 1;
      });
    } else {
      setState(() {
        weight -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff9244E3),
                fontWeight: FontWeight.w700),
          ),
          foregroundColor: Color(0xff9244E3),
          centerTitle: true,
          backgroundColor: Color(0xffEFE1FC),
        ),
        backgroundColor: Color(0xffEFE1FC),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectGender(true);
                          print("Male");
                        },
                        child: ReuseableCard(
                          borderColor: Colors.blue.shade800,
                          color: maleColour, 
                          // Color(0xffDBEEFF),
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Male',
                                  style: mytextstyle(Colors.orange),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.mars,
                                    size: 75,
                                    color: Colors.blue[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectGender(false);
                          print("Female");
                        },
                        child: ReuseableCard(
                          borderColor: Colors.deepOrange,
                          color: femaleColour,
                          // Colors.white60,
                          // Color(0xffFBDDDB),
                          
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Female',
                                    style: mytextstyle(Colors.orange),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.venus,
                                    size: 75,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        borderColor: Colors.grey.shade300,
                        color: Colors.white60,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: mytextstyle(Color(0xff9244E3)),
                            ),
                            Text(
                              "$age",
                              style: mynumstyle(Color(0xffCB9C4E)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff957A4C), width: 5),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: Icons.add,
                                  func: () => addSubAge(true),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundButton(
                                  icon: Icons.remove,
                                  func: () => addSubAge(false),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReuseableCard(
                        color: Colors.white60,
                        borderColor: Colors.grey.shade300,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: mytextstyle(Color(0xff9244E3)),
                            ),
                            Text(
                              "$weight",
                              style: mynumstyle(Color(0xffCB9C4E)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff957A4C), width: 5),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: Icons.add,
                                  func: () => addSubWeight(true),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundButton(
                                  icon: Icons.remove,
                                  func: () => addSubWeight(false),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  borderColor: Colors.grey.shade300,
                  color: Colors.white60,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text("Height (in cm)",
                              style: mytextstyle(Color(0xff9244E3))),
                        ),
                        Text("$heightSlider",
                            style: TextStyle(
                                color: Color(0xffCB9C4E),
                                fontSize: 45,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff957A4C), width: 5),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Slider(
                            min: 100,
                            max: 250,
                            value: heightSlider.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                heightSlider = value.toInt();
                              });
                            },
                            activeColor: Color(0xff9244E3),
                            thumbColor: Color(0xffCB9C4E),
                            inactiveColor: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              height: (heightSlider / 100),
                              weight: weight,
                              age: age)));
                  ;
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff9244E3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Calculate BMI",
                    style: mytextstyle(Colors.white)
                    ),
                ),
              )
            ],
          ),
        ));
  }
}

class ReuseableCard extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Widget cardChild;
  const ReuseableCard(
      {super.key,
      required this.color,
      required this.cardChild,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          border: Border(
              top: BorderSide(color: borderColor, width: 1),
              bottom: BorderSide(color: borderColor, width: 1),
              left: BorderSide(color: borderColor, width: 1),
              right: BorderSide(color: borderColor, width: 1)),
          borderRadius: BorderRadius.circular(20)),
      child: cardChild,
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final void Function() func;
  const RoundButton({super.key, required this.icon, required this.func});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: func,
      elevation: 5,
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 40, minWidth: 40),
      fillColor: Colors.grey[200],
      child: Icon(
        icon,
        size: 34,
        color: Color(0xff957A4C),
      ),
    );
  }
}
