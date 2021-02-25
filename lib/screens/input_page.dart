import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/IconContent.dart';
import '../components/ReusableCard.dart';
import '../constant.dart';
import 'results.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

//Color(0XFF1D1E33)


enum Gender {
   male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 120;
  int weight = 0;
  int Age = 1;
  //Color maleColour = inactiveCardColour;
  // Color femaleColour = inactiveCardColour;
  //
  // void updateColor( Gender  SelectedGender) {
  //   if (SelectedGender == Gender.male) {
  //     if (maleColour == inactiveCardColour) {
  //       maleColour = activeCardColour;
  //       femaleColour = inactiveCardColour;
  //     } else {
  //       maleColour = inactiveCardColour;
  //     }
  //   }
  //   if (SelectedGender == Gender.female) {
  //     if (femaleColour == inactiveCardColour) {
  //       femaleColour = activeCardColour;
  //       maleColour = inactiveCardColour;
  //     } else {
  //       femaleColour = inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR' , textAlign: TextAlign.center,),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Row(
            children:<Widget>[
              Expanded(
            child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColour:kInactiveCardColour,
                  cardchild: IconContent(
                    icon: FontAwesomeIcons.mars, label: 'MALE',
                  ),
            ),
    ),
              Expanded(
               child: ReusableCard(
                 onPress: (){
                   setState(() {
                     selectedGender = Gender.female;
                   });
                 },
                  colour: selectedGender == Gender.female ? kActiveCardColour:kInactiveCardColour,
                  cardchild: IconContent(
                  icon: FontAwesomeIcons.venus, label: 'FEMALE',
                ),
                ),
              ),
            ],
          )),
          Expanded(
          child: ReusableCard(
           colour: kActiveCardColour,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT', style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget> [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm', style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Colors.pink,
                  inactiveColor: Colors.blueGrey,
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
            ),
          ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                  colour: kActiveCardColour,
                   cardchild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         'WEIGHT', style: kLabelTextStyle,
                       ),
                       Text(
                         weight.toString(),
                         style: kNumberTextStyle,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },

                           ),
                           SizedBox( width: 10.0,),
                           RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                           ),
                         ],
                       )
                     ],
                   ),
              )),
              Expanded(child: ReusableCard(
                  colour: kActiveCardColour,
                   cardchild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget> [
                       Text(
                         'Age', style: kLabelTextStyle,
                       ),
                       Text(
                         Age.toString(),
                         style: kNumberTextStyle,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget> [
                           RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                             setState(() {
                               Age--;
                             });
                           }),
                           SizedBox( width: 10.0,),
                           RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                             setState(() {
                               Age++;
                             });
                           }),
                         ],

                       )
                     ]


    ),
              ),
              ),
            ],
          )),
          BottomButton( buttonTitle: 'Calculate',
            onTap: () {
            CalculatorBrain Calc = CalculatorBrain( height: height, weight: weight);
            Navigator.push((context),
              MaterialPageRoute(builder: (context) => Results(
                bmiResult: Calc.calculateBMI(),
                textResult: Calc.getResults() ,
                interpretation: Calc.getInterpretations(),
              ),
            ),
            );
          },

          ),
        ],
      )
    );
  }
}




 



