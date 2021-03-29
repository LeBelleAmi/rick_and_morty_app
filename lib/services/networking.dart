import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rickandmortyapp/utilities/constants.dart';

import '../models/character.dart';

class NetworkHelper {
  //final String url;
  //NetworkHelper(this.url);
  Future<List<Character>> getCharactersData() async {
    http.Response response = await http.get('$kApiUrl');
    List<Character> allCharacterList = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      for (var item in data['results']) {
        Character character = Character.fromJson(item);
        allCharacterList.add(character);
      }
      return allCharacterList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
