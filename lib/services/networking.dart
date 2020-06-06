import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rickandmortyapp/utilities/constants.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  static Future<dynamic> getCharactersData() async {
    try {
      http.Response response = await http.get('$kApiUrl');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
//        print(data);
        return data;
      } else {
        //print(response.statusCode);
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
