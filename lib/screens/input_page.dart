import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/icon_content.dart';
import '../custom_widgets/reusable_card.dart';
import '../models/gender_picking_logic.dart';

const double bottomButtonHeight = 80.0;
const Color bottomButtonColor = Color(0xFFEB3154);
const Color cardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderLogic genderCardLogic = GenderLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      genderCardLogic.selectedGender(gender: Gender.male);
                    });
                  },
                  color: genderCardLogic.changeCardState(gender: Gender.male),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                    iconColor:
                        genderCardLogic.changeIconState(gender: Gender.male),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      genderCardLogic.selectedGender(gender: Gender.female);
                    });
                  },
                  color: genderCardLogic.changeCardState(gender: Gender.female),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                    iconColor:
                        genderCardLogic.changeIconState(gender: Gender.female),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: cardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: cardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: cardColor,
                ),
              ),
            ],
          )),
          Container(
            color: bottomButtonColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomButtonHeight,
          ),
        ],
      ),
    );
  }
}
