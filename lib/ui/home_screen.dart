import 'package:flutter/material.dart';
import 'package:rickandmortyapp/blocs/character_bloc.dart';
import 'package:rickandmortyapp/components/character_card.dart';
import 'package:rickandmortyapp/ui/character_screen.dart';
import 'package:rickandmortyapp/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    bloc.fetchAllCharacters();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
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
        child: StreamBuilder(
          stream: bloc.allCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return
              GridView.builder(
                itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return CharacterCard(
                      imageUrl: snapshot.data[index].image,
                      characterName: snapshot.data[index].name,
                      characterSpecie: snapshot.data[index].species,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterScreen(character: snapshot.data[index])),
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
