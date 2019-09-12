import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String title = "Settings";
  bool tidesSwitched = false;
  bool astroSwitched = false;
  bool animationSwitched = false;
  String unitTemp;
  String unitSystem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
          colors: [Color(0xff444444), Color(0xff151515)],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(title.toUpperCase(), style: normalBig),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            FlatButton(
              onPressed: () {
                bottomSheet(
                    context, "display", ["Tides", "Astro", "Animation"], 280);
              },
              child: Text("Visuals".toUpperCase(), style: normalBig),
            ),
            SizedBox(height: 40),
            FlatButton(
              onPressed: () {
                bottomSheet(
                    context, "events", ["Rain", "Snow", "Tides", "Astro"], 340);
              },
              child: Text("Notifications".toUpperCase(), style: normalBig),
            ),
            SizedBox(height: 40),
            FlatButton(
              onPressed: () {
                bottomSheetUnits(context, "units");
              },
              child: Text("Units".toUpperCase(), style: normalBig),
            ),
            SizedBox(height: 40),
            FlatButton(
              onPressed: () {
                bottomSheetInfo(context, "Info");
              },
              child: Text("Info".toUpperCase(), style: normalBig),
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheetInfo(context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 140,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                color: greyColor,
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Clear saved locations", style: TextStyle(fontSize: 24)),
                    FlatButton(
                      color: Colors.red,
                      child: Text("Clear", style: normalBig),
                      onPressed: (){},
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void bottomSheetUnits(context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 220,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                color: greyColor,
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("C°", style: TextStyle(fontSize: 24)),
                          Radio(
                            groupValue: unitTemp,
                            value: 0,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("F°", style: TextStyle(fontSize: 24)),
                          Radio(
                            groupValue: unitTemp,
                            value: 0,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Metric", style: TextStyle(fontSize: 24)),
                          Radio(
                            groupValue: unitSystem,
                            value: 0,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Imperial", style: TextStyle(fontSize: 24)),
                          Radio(
                            groupValue: unitSystem,
                            value: 0,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void bottomSheet(
      context, String title, List<String> switches, double height) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: height,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                color: greyColor,
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: switchTitle(switches),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> switchTitle(List<String> titles) {
    List<Widget> switchList = [];

    for (String title in titles) {
      switchList.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
              Switch(
                value: tidesSwitched,
                onChanged: (value) {
                  setState(() {
                    tidesSwitched = value;
                  });
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: accentColor,
              ),
            ],
          ),
        ),
      );
    }

    return switchList;
  }
}
