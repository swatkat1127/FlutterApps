import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/ReusableCard.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class Results extends StatelessWidget {

  Results({ @required this.bmiResult, @required this.textResult, @required this.interpretation});
  final String bmiResult;
  final String textResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result', style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      textResult.toUpperCase(), style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,style: kBMITextStyle,
                    ),
                    Text(
                      interpretation, style: kLabelTextStyle,
                       textAlign: TextAlign.center,
                    ),
                  ],
                ) ),
            ),
          BottomButton( buttonTitle: 'Re-Calculate',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
