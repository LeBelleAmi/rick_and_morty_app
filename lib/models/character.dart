class Character {
  final int id;
  final String name;
  final String species;
  final String image;

  Character({this.id, this.name, this.species, this.image});

  factory Character.fromJson(Map<String, dynamic> jsonMap) {
    return Character(
        id: jsonMap['id'],
        name: jsonMap['name'],
        species: jsonMap['species'],
        image: jsonMap['image']);
  }
}
