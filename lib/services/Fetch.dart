import 'dart:convert';

import 'package:TestFlutterApp/models/character.dart';
import 'package:http/http.dart' as http;

class FetchService {
  Future getCharacters() async {
    String url = "https://rickandmortyapi.com/api/character";
    try {
      http.Response response = await http.get(url);

      Map<dynamic, dynamic> json = jsonDecode(response.body);

      List results = json['results'];

      List characterList = results
          .map((char) => Character(
              name: char['name'],
              gender: char['gender'],
              id: char['id'],
              status: char['status'],
              urlImage: char['image']))
          .toList();

      return characterList;
    } catch (e) {
      return (e.toString());
    }
  }
}
