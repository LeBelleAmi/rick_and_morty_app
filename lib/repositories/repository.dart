import '../models/character.dart';
import '../services/networking.dart';

class Repository {
  final charactersApiProvider = NetworkHelper();

  Future<List<Character>> fetchAllCharacters() => charactersApiProvider.getCharactersData();
}