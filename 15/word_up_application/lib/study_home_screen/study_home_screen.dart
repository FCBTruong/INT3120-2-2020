import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import '../word.dart';
import 'word_box.dart';

class StudyHomeScreen extends StatefulWidget {
  final List<WordBox> listWords = new List<WordBox>();
  @override
  State<StatefulWidget> createState() => _StudyHomeScreenState();
}

class _StudyHomeScreenState extends State<StudyHomeScreen> {
  List<Word> listWordsNeedToLearn;
  int _current = 0;
  @override
  void initState() {
    _readData().then((value) => {
     setState(() {

     })
    });
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  Future<void> _readData() async {
    listWordsNeedToLearn =
        await DatabaseLocalHelper.instance.getListToLearnWords();
    widget.listWords.clear();
    for (int i = 0; i < listWordsNeedToLearn.length; i++) {
      widget.listWords.add(
        WordBox(word: listWordsNeedToLearn[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Container(
        decoration: CommonComponents.background,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5 * SizeConfig.heightMultiplier),
                child: CarouselSlider(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  height: 45 * SizeConfig.heightMultiplier,
                  initialPage: 0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: widget.listWords,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 3 * SizeConfig.heightMultiplier),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: (listWordsNeedToLearn.length > 0) ? new ShowExamples(listExamples: listWordsNeedToLearn[_current].examples): Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
