import 'package:flutter/material.dart';
import 'package:rickandmortyapp/components/character_card.dart';
import 'package:rickandmortyapp/screens/character_screen.dart';
import 'package:rickandmortyapp/utilities/constants.dart';
import 'package:rickandmortyapp/services/networking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHomeDataLoading;

  Future<dynamic> getCharactersList() async {
    isHomeDataLoading = true;
    try {
      var characterData = await NetworkHelper.getCharactersData();
      isHomeDataLoading = false;
      //print(characterData);
      return characterData;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    isHomeDataLoading = false;
    getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Rick and Morty')),
        elevation: 1.0,
        backgroundColor: kAppColor,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<dynamic>(
          future: getCharactersList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return CharacterCard(
                      imageUrl: snapshot.data['results'][index]['image'],
                      characterName: snapshot.data['results'][index]['name'],
                      characterSpecie: snapshot.data['results'][index]
                          ['species'],
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterScreen()),
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
