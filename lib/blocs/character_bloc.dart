import 'package:rickandmortyapp/repositories/repository.dart';

import '../models/character.dart';
import 'package:rxdart/rxdart.dart';

class CharactersBloc {
  final _repository = Repository();
  final _charactersFetcher = PublishSubject<List<Character>>();

  Stream<List<Character>> get allCharacters => _charactersFetcher.stream;

  fetchAllCharacters() async {
    List<Character> character = await _repository.fetchAllCharacters();
    _charactersFetcher.sink.add(character);
  }

  dispose() {
    _charactersFetcher.close();
  }
}

final bloc = CharactersBloc();