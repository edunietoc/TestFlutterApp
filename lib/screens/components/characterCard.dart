import 'package:TestFlutterApp/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: (MediaQuery.of(context).size.width / 2) - 50),
                  child: Image.network(character.urlImage),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          character.name,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Gender: ${character.gender}",
                            style: TextStyle(fontSize: 18),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "${character.status}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: character.status == "Alive"
                                    ? Colors.green
                                    : Colors.red),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
