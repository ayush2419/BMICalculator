import 'package:bmi/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableIcon.dart';
import 'reusableWidget.dart';
import 'constants.dart';
import 'bmi_Calculator.dart';

enum Gender { male, female }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Color maleIconInactiveColour = Color(0xFF8D8E98);
  Color femaleIconInactiveColour = Color(0xFF8D8E98);

  TextStyle maleCard = kLabelTextStyle;
  TextStyle femaleCard = kLabelTextStyle;

  int height = 180;
  int weight = 60;
  int age = 18;

  //Function to update color of male/female card on pressing
  void updateColour(Gender selectedGender) {
    //to update male card color
    if (selectedGender == Gender.male) {
      if (maleCardColour == kInactiveCardColour) {
        maleCardColour = kActiveCardColour;
        maleIconInactiveColour = Colors.white;
        maleCard = TextStyle(
          fontSize: 18.00,
          color: Colors.white,
        );
        femaleCardColour = kInactiveCardColour;
        femaleCard = kLabelTextStyle;
        femaleIconInactiveColour = kIconInactiveColour;
      } else {
        maleCardColour = kInactiveCardColour;
        maleIconInactiveColour = kIconInactiveColour;
        maleCard = kLabelTextStyle;
        femaleCardColour = kInactiveCardColour;
        femaleCard = kLabelTextStyle;
        femaleIconInactiveColour = kIconInactiveColour;
      }
    }
    //TO update female card color
    else if (selectedGender == Gender.female) {
      if (femaleCardColour == kInactiveCardColour) {
        femaleCardColour = kActiveCardColour;
        femaleIconInactiveColour = Colors.white;
        femaleCard = TextStyle(
          fontSize: 18.00,
          color: Colors.white,
        );
        maleCardColour = kInactiveCardColour;
        maleCard = kLabelTextStyle;
        maleIconInactiveColour = kIconInactiveColour;
      } else {
        femaleCardColour = kInactiveCardColour;
        femaleIconInactiveColour = kIconInactiveColour;
        femaleCard = kLabelTextStyle;
        maleCard = kLabelTextStyle;
        maleCardColour = kInactiveCardColour;
        maleIconInactiveColour = kIconInactiveColour;
      }
    }
  }

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
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableBox(
                    onPress: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    colour: maleCardColour,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      iconLabel: 'MALE',
                      iconTextStyle: maleCard,
                      iconColour: maleIconInactiveColour,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableBox(
                    onPress: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    colour: femaleCardColour,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.venus,
                      iconLabel: 'FEMALE',
                      iconTextStyle: femaleCard,
                      iconColour: femaleIconInactiveColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableBox(
              colour: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 1.00,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 16.00),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.00),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.00,
                        max: 300.00,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableBox(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconForRoundedIconButton: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 15.00,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconForRoundedIconButton: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableBox(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              iconForRoundedIconButton: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 15.00,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconForRoundedIconButton: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              BMICalculator calc =
                  BMICalculator(weight: weight, height: height);

              Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(calc.getBMI(),
                      calc.getInterpretation(), calc.getResult()));
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.00),
        padding: EdgeInsets.only(bottom: 10.00),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColour,
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 30.00,
              fontWeight: FontWeight.bold,
              color: Color(0xFF021021)),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.iconForRoundedIconButton, required this.onPressed});

  final IconData? iconForRoundedIconButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconForRoundedIconButton,
        color: Colors.white,
      ),
      onPressed: onPressed,
      elevation: 10.00,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

class ScreenArguments {
  final String result;
  final String bmi;
  final String interpret;

  ScreenArguments(this.bmi, this.interpret, this.result);
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/ResultPage';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return ResultPage(
      bmiResult: args.bmi,
      interpretation: args.interpret,
      resultText: args.result,
    );
  }
}
