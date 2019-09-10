import 'dart:ui';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'San Fransisco';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset("images/3.jpg", fit: BoxFit.fitHeight),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.white,
                        elevation: 0,
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            if (newValue != '') {
                              dropdownValue = newValue;
                            }
                          });
                        },
                        items: <String>[
                          '',
                          'San Fransisco',
                          'SLO',
                          'Los Angeles',
                          'New York'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: bigBoldShadow,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('6 August 2019', style: normalMedium),
                    SizedBox(width: 16),
                    Text('7:45 PM', style: normalMedium),
                  ],
                ),
                SizedBox(height: 80),
                mainDisplay(75, "it\'s sunny", 60, 80, 9, 50, 41),
                SizedBox(height: 40),
                gradientTemp(
                    [54, 54, 52, 56, 56, 56, 56, 60, 62, 67, 70, 74, 77, 76, 75, 73, 72, 69, 65, 59, 58, 58, 57, 56, 56]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainDisplay(int temp, String message, int low, int high, int mph,
      int rain, int humidity) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: ((MediaQuery.of(context).size.width - 64) / 2) - 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("$temp°", style: giantBold),
                    Text("$message", style: normalLarge),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("$low°", style: normalLarge),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                        Row(
                          children: <Widget>[
                            Text("$high°", style: normalLarge),
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                color: Colors.white,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width - 64) / 2) - 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 18,
                            child: Text(
                              "Wind",
                              style: normalMedium,
                            ),
                          ),
                          Container(
                            height: 18,
                            child: Text(
                              "Rain",
                              style: normalMedium,
                            ),
                          ),
                          Container(
                            height: 18,
                            child: Text(
                              "Humidity",
                              style: normalMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //out of 100mph
                                LinearPercentIndicator(
                                  width: 100.0,
                                  lineHeight: 2.0,
                                  percent: mph / 100,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("$mph mph", style: normalXSmall)
                              ],
                            ),
                          ),
                          Container(
                            height: 18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                LinearPercentIndicator(
                                  width: 100.0,
                                  lineHeight: 2.0,
                                  percent: rain / 100,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("$rain %", style: normalXSmall)
                              ],
                            ),
                          ),
                          Container(
                            height: 18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                LinearPercentIndicator(
                                  width: 100.0,
                                  lineHeight: 2.0,
                                  percent: humidity / 100,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("$humidity %", style: normalXSmall)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gradientTemp(List<int> tempList) {
    List<Color> colorList = convertToColor(tempList);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("12pm", style: normalSmall),
            Text("12am", style: normalSmall),
            Text("12pm", style: normalSmall),
          ],
        ),
        SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Container(
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: gradientStopList(13),
                  colors: colorList,
                ),
              ),
            ),
            Container(
              height: 32,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: temperatureList(tempList),
              ),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> temperatureList(List<int> tempList){
    List<Widget> widgetList = [];
    for(int i = 0; i < tempList.length; i+=2){
      Widget text = Text("${tempList[i]}°", style: thinXSmall);
      widgetList.add(text);
    }
    return widgetList;
  }

  List<Color> convertToColor(List<int> intList) {
    List<Color> colorList = [];
    for (int i = 0; i < intList.length; i+=2) {
      //sunrise (6am-8am)
      if (i >= 3 && i <= 4) {
        colorList.add(morningColor.withOpacity(0.75));
      }
      //sunset (6pm-8pm)
      else if (i >= 9 && i <= 10) {
        colorList.add(eveningColor.withOpacity(0.75));
      }
      //temp < 50 F
      else if (intList[i] < 55) {
        colorList.add(coldColor.withOpacity(0.75));
      }
      //temp < 50 F
      else if (intList[i] < 70) {
        colorList.add(mediumColor.withOpacity(0.75));
      } else {
        colorList.add(hotColor.withOpacity(0.75));
      }
    }
    return colorList;
  }

  List<double> gradientStopList(int num) {
    double total = 0;
    double inc = 1 / num;
    List<double> stopList = [];
    for (int i = 0; i < num; i++) {
      total += inc;
      stopList.add(total);
    }
    return stopList;
  }
}
