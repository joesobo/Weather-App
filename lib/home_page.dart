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
                mainDisplay(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainDisplay() {
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
                    Text("75°", style: giantBold),
                    Text("it's sunny", style: normalLarge),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("60°", style: normalLarge),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                        Row(
                          children: <Widget>[
                            Text("80°", style: normalLarge),
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
                                LinearPercentIndicator(
                                  width: 100.0,
                                  lineHeight: 2.0,
                                  percent: 0.2,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("9 mph", style: normalXSmall)
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
                                  percent: 0.5,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("50 %", style: normalXSmall)
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
                                  percent: 0.41,
                                  backgroundColor: Colors.white,
                                  progressColor: accentColor,
                                ),
                                SizedBox(height: 4),
                                Text("41 %", style: normalXSmall)
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
}
