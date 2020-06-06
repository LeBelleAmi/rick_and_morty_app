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
    return GestureDetector(
      child: Card(
        elevation: 10,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: kInactiveCardColour,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'images/benjamin-catapane-Pn7JBX42z3Q-unsplash.jpg',
              image: imageUrl,
              fit: BoxFit.fill,
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
      ),
      onTap: onPress,
    );
  }
}
