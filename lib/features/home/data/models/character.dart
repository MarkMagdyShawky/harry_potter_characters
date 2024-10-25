class Character {
  late String id;
  late String name;
  late String image;
  late String species; //? Human or somthing else
  late String gender;
  late String house;
  late bool iswizard; // ! magicano or not
  late String halfBloodORBureOrMuggle; //! ancestry
  late String eyeColor;
  late String hairColor;
  late String actorName;
  late bool isAlive;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    house = json['house'];
    iswizard = json['wizard'];
    halfBloodORBureOrMuggle = json['ancestry'];
    eyeColor = json['eyeColour'];
    hairColor = json['hairColour'];
    actorName = json['actor'];
    isAlive = json['alive'];
  }
}

class Wand {
  late String wandName;
  late String wandCore;
  late String wandLength;

  Wand.fromJson(Map<String, dynamic> json) {
    wandName = json['wand'];
    wandCore = json['core'];
    wandLength = json['length'];
  }
}
