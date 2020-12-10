import 'package:TestFlutterApp/services/SharedPreferences.dart';
import 'package:TestFlutterApp/shared/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;
  SharedPreferencesService sharedPrefs = SharedPreferencesService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Rick & Morty"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/RickAndMorty.jpg')),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    decoration: textInputDecoration.copyWith(
                        hintText: "Insert Your Name"),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    sharedPrefs.saveName(name);
                    Navigator.pushNamed(context, '/Characters');
                  },
                  color: Colors.green,
                  child: Text(
                    "Save and Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
