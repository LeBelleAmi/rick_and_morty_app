import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapp/utilities/constants.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(
      {this.imageUrl,
      this.characterName,
      this.characterSpecie,
      @required this.onPress});
  @required
  final String imageUrl;
  final String characterName;
  final String characterSpecie;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: kInactiveCardColour,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.32),
                  blurRadius: 20,
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FadeInImage.assetNetwork(
                  placeholder:
                      'images/benjamin-catapane-Pn7JBX42z3Q-unsplash.jpg',
                  image: imageUrl,
                  fit: BoxFit.cover,
                  height: size.height * 0.13,
                  width: size.width,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(characterName != null ? characterName : 'Rick'),
                  subtitle: Text(
                    characterSpecie != null ? characterSpecie : 'Human',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
