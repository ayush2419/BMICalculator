import 'package:bmi/constants.dart';
import 'package:bmi/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF021021),
      appBar: AppBar(
        backgroundColor: Color(0xFF020021),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 30.00,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(text: 'BMI'),
              TextSpan(
                text: ' Calculator',
                style: TextStyle(
                  color: Color(0xFFEB1555),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.00),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kNumLabelTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsetsDirectional.all(15.00),
              decoration: BoxDecoration(
                color: kInactiveCardColour,
                borderRadius: BorderRadius.circular(10.00),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 35.00,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00c02c),
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 80.00,
                        color: Colors.white),
                  ),
                  Text(
                    interpretation,
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
