import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/main.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/home/home_screen.dart';

class FinishSelectionScreen extends StatefulWidget {
  var n;
  FinishSelectionScreen({this.n});
  @override
  State<StatefulWidget> createState() => _FinishSelectionScreenState();
}

class _FinishSelectionScreenState extends State<FinishSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.lightBlueAccent,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 6 * SizeConfig.heightMultiplier),
              child: MaterialButton(
                minWidth: 4 * SizeConfig.heightMultiplier,
                padding:
                    EdgeInsets.only(left: 48 * SizeConfig.heightMultiplier),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MyApp()));
                },
                child: Icon(
                  Icons.close,
                  size: 6 * SizeConfig.heightMultiplier,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Text(
                      'Well Done!',
                      style: TextStyle(
                          fontSize: 5.8 * SizeConfig.textMultiplier,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'You just found ' +
                          widget.n.toString() +
                          ' words to learn',
                      style: TextStyle(
                          fontSize: 2.7 * SizeConfig.textMultiplier,
                          color: Colors.white),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  top: 2 * SizeConfig.heightMultiplier,
                  right: 2 * SizeConfig.widthMultiplier),
              child: Image.asset('assets/images/welldone.png'),
            ),
            Card(
              elevation: 8,
              color: Colors.white,
              margin: EdgeInsets.only(top: 0),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(2 * SizeConfig.heightMultiplier),
              ),
              child: Container(
                width: 0.7 * SizeConfig.screenWidth,
                height: 20 * SizeConfig.heightMultiplier,
                child: Column(
                  children: [
                    Card(
                      elevation: 7,
                      margin:
                          EdgeInsets.only(top: 3 * SizeConfig.heightMultiplier),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            2 * SizeConfig.heightMultiplier),
                      ),
                      child: Container(
                        width: 0.5 * SizeConfig.screenWidth,
                        height: 6 * SizeConfig.heightMultiplier,
                        padding:
                            EdgeInsets.only(top: SizeConfig.textMultiplier),
                        child: Text(
                          'Continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 3 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Card(
                        elevation: 7,
                        margin: EdgeInsets.only(
                            top: 3 * SizeConfig.heightMultiplier),
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              2 * SizeConfig.heightMultiplier),
                        ),
                        child: Container(
                          //margin: EdgeInsets.only(top: 2*SizeConfig.heightMultiplier),
                          width: 0.5 * SizeConfig.screenWidth,
                          height: 6 * SizeConfig.heightMultiplier,
                          padding:
                              EdgeInsets.only(top: SizeConfig.textMultiplier),
                          child: Text(
                            'Enough',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}