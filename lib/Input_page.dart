import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCard = Color(0x55ffffff);
  Color femaleTC = Colors.white;
  Color maleCard = Color(0x55ffffff);
  Color maleTC = Colors.white;
  int pickedGender = -1;
  static int height = 170;
  static int age = 18;
  static int weight = 65;

  void Reset(){
    femaleCard = Color(0x55ffffff);
    femaleTC = Colors.white;
    maleCard = Color(0x55ffffff);
    maleTC = Colors.white;
    pickedGender = 1;
    height = 170;
    age = 18;
    weight = 65;
  }
  void updateColor(int gender) {
    //male
    if (gender == 1) {
      if (maleCard == Colors.white) {
        maleCard = Color(0x55ffffff);
        maleTC = Colors.white;
        pickedGender = -1;
      } else {
        maleTC = Color(0xffEA8549);
        maleCard = Colors.white;
        femaleCard = Color(0x55ffffff);
        femaleTC = Colors.white;
        pickedGender = 1;
      }
    } else {
      if (femaleCard == Colors.white) {
        femaleCard = Color(0x55ffffff);
        femaleTC = Colors.white;
        pickedGender = -1;
      } else {
        femaleTC = Color(0xffEA8549);
        femaleCard = Colors.white;
        maleCard = Color(0x55ffffff);
        maleTC = Colors.white;
        pickedGender = 1;
      }
    }
  }
  createAlertDialog({BuildContext context,String interpretation,String bmi,String result}){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(bmi,style:TextStyle(fontSize: 30, color: Color(0xffEA8549),fontWeight: FontWeight.bold) ,),
        content: Text(result+'\n'+interpretation,style:TextStyle(fontSize: 20, color: Color(0xffEA8549)) ,),
        actions: <Widget>[
          MaterialButton(
            elevation: 5,
            child: Text("Ok",style:TextStyle(fontSize: 30, color: Color(0xffEA8549),fontWeight: FontWeight.bold) ,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffEA8549), Color(0xffE95263)],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                    child: Text(
                  "BMI Calculator",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
                Text('Gender',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RoundButton(
                      buttonColor: maleCard,
                      textIconColor: maleTC,
                      text: 'Male',
                      icon: Icon(FontAwesomeIcons.mars),
                      pressed: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                    ),
                    RoundButton(
                      buttonColor: femaleCard,
                      textIconColor: femaleTC,
                      text: 'Female',
                      icon: Icon(FontAwesomeIcons.venus),
                      pressed: () {
                        setState(() {
                          updateColor(0);
                        });
                      },
                    ),
                  ],
                ),
                Text('Height',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      child: Slider(
                        min: 150,
                        max: 220,
                        value: height.toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Color(0x55ffffff),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x55ffffff)),
                      child: Center(
                        child: Text(
                          height.toString() + " Cm",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Weight',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      child: Slider(
                        min: 35,
                        max: 200,
                        value: weight.toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Color(0x55ffffff),
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.round();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x55ffffff)),
                      child: Center(
                        child: Text(
                          weight.toString() + " Kg",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Age',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: age.toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Color(0x55ffffff),
                        onChanged: (double newValue) {
                          setState(() {
                            age = newValue.round();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x55ffffff)),
                      child: Center(
                        child: Text(
                          age.toString() + " Yo",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                RoundButton(
                  buttonColor: Colors.white,
                  textIconColor: Color(0xffEA8549),
                  text: 'Calculate',
                  icon: Icon(FontAwesomeIcons.calculator),
                  pressed: () {
                    var calc= CalculatorBrain(weight:weight,height: height);
                    createAlertDialog(context: context,bmi: calc.calculateBmi(),interpretation: calc.getInterpretation(),result: calc.getResult());
                    setState(() {
                      Reset();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatefulWidget {
  Color buttonColor = Colors.white;
  Color textIconColor = Color(0xffEA8549);
  final Function pressed;
  final Icon icon;
  final String text;
  RoundButton(
      {this.text,
      this.icon,
      this.pressed,
      this.buttonColor,
      this.textIconColor});
  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 40,
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon.icon,
              color: widget.textIconColor,
            ),
            SizedBox(width: 10),
            Text(
              widget.text,
              style: TextStyle(fontSize: 18, color: widget.textIconColor),
            )
          ],
        ),
        onPressed: () {
          setState(() {
            widget.pressed();
          });
        },
        color: widget.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
