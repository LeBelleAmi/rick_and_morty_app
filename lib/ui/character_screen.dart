import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rickandmortyapp/models/character.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  const CharacterScreen({Key key, this.character}) : super(key: key);

  
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                widget.character.image),
            fit: BoxFit.cover,
          ),
        ),
        height: size.height,
        width: size.width,
        child: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: new EdgeInsets.only(top: 250.0),
              height: 200.0,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [new Color(0x00736AB7), new Color(0xff111328)],
                  stops: [0.0, 0.9],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.1),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.character.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.character.species,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
