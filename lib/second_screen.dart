import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double height;
  final int age;
  final int weight;
  const ResultScreen(
      {super.key,
      required this.height,
      required this.age,
      required this.weight});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double calculateBMI() {
    double bmi = widget.weight / (widget.height * widget.height);
    return bmi;
  }

  var bmiColor = Colors.black;
  var bmiText = 'Normal';
  var imagepath = 'normal';

  @override
  void initState(){
    super.initState();
    updateUI();
  }

  void updateUI() {
    var bmi = calculateBMI();
    if (bmi < 18.5) {
      setState(() {
        bmiColor = Colors.blue;
        bmiText = 'Underweight';
        imagepath = 'underweight';
      });
    } else if (bmi >= 18.5 && bmi <= 25) {
      bmiColor = Colors.green;
      bmiText = 'Normal';
      imagepath = 'normal';
    }else if(bmi > 25 && bmi <= 30){
      bmiColor = Colors.yellow.shade700;
      bmiText = 'Overweight';
      imagepath = 'overweight';
    }else if(bmi > 30 && bmi < 40){
      bmiColor = Colors.orange;
      bmiText = 'Obese';
      imagepath = 'obese';
    }else if(bmi >= 40){
      bmiColor = Colors.red;
      bmiText = 'ExtremeObese';
      imagepath = 'extreme';
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
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BMI Result:",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff905DBD),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                width: 180,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: bmiColor, width: 5))),
                child: Text(
                  calculateBMI().toStringAsFixed(1),
                  style: TextStyle(
                      fontSize: 70,
                      color: bmiColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
               Text(
                  bmiText,
                  style: TextStyle(
                      fontSize: 25,
                      color: bmiColor,
                      fontWeight: FontWeight.bold),
                ),
              Image(image: AssetImage("images/${imagepath}.png")),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff9244E3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Calculate Again",
                    style: TextStyle(
                        fontFamily: 'Pangolin',
                        fontSize: 40,
                        letterSpacing: 1.25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        )
        );
  }
}
