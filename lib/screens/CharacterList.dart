import 'package:TestFlutterApp/models/character.dart';
import 'package:TestFlutterApp/screens/components/characterCard.dart';
import 'package:TestFlutterApp/services/Fetch.dart';
import 'package:TestFlutterApp/services/SharedPreferences.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  CharacterList({Key key}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  FetchService fetch = FetchService();
  SharedPreferencesService sharedPref = SharedPreferencesService();

  String myName = '';

  @override
  void initState() {
    super.initState();
    sharedPref.readName().then((value) {
      setState(() {
        myName = value;
      });
    });
  }

  String currentName = '';
  String message = '';

  List characterIndexList = new List();

  List<Character> characterList;

  void searchCharacter() {
    if (characterList.length > 0) {
      List characterNames = characterList.map((e) => e.name).toList();

      print("current Name: $currentName");

      RegExp exp = new RegExp(
        "\\b" + currentName + "\\b",
        caseSensitive: false,
      );

      List matchList = characterNames.map((e) {
        if (exp.hasMatch(e)) {
          return characterNames.indexOf(e);
        } else {
          return null;
        }
      }).toList();

      print("Characters found $matchList");

      List charactersFound = matchList.whereType<int>().toList();
      print("characters Found:  $charactersFound");
      setState(() {
        characterIndexList = charactersFound;
        message = "We have found ${charactersFound.length} many characters";
      });
      /*    print("Character Found"); */
      /* setState(() {
        characterIndex = characterNames.indexOf(currentName);
        message = "Index of your character is ${characterIndex}";
      }); */
    } else {
      setState(() {
        message = "Character List was not properly loaded";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${myName}"),
      ),
      body: Column(
        children: [
          Container(
              height: 100,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(30, 2, 5, 5),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search By Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25.0),
                                right: Radius.circular(25.0),
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25.0),
                                right: Radius.circular(25.0),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green[200], width: 2.0),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25.0),
                                right: Radius.circular(25.0),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green[200], width: 2.0),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(24.0),
                                right: Radius.circular(24.0),
                              )),
                        ),
                        onChanged: (value) {
                          setState(() {
                            currentName = value;
                          });
                          searchCharacter();
                        }),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        message,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: FutureBuilder(
              future: fetch.getCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    characterList = snapshot.data;
                    int lenght;

                    if (characterIndexList.length > 0) {
                      lenght = characterIndexList.length;
                    } else {
                      lenght = characterList.length;
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: lenght,
                      itemBuilder: (BuildContext context, int index) {
                        Character currentCharacter;
                        if (characterIndexList.length > 0) {
                          currentCharacter =
                              characterList[characterIndexList[index]];
                        } else {
                          currentCharacter = characterList[index];
                        }

                        return CharacterCard(
                          character: currentCharacter,
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                }

                return Text("Is loading");
              },
            ),
          ),
        ],
      ),
    );
  }
}
