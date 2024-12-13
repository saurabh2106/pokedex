// ignore_for_file: non_constant_identifier_names
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pokemon_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 01)
class PokemonModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? imageurl;
  @HiveField(3)
  final String? xdescription;
  @HiveField(4)
  final String? ydescription;
  @HiveField(5)
  final String? height;
  @HiveField(6)
  final String? category;
  @HiveField(7)
  final String? weight;
  @HiveField(8)
  final List<String>? typeofpokemon;
  @HiveField(9)
  final List<String>? weaknesses;
  @HiveField(10)
  final List<String>? evolutions;
  @HiveField(11)
  final List<String>? abilities;
  @HiveField(12)
  final num? hp;
  @HiveField(13)
  final num? attack;
  @HiveField(14)
  final num? defense;
  @HiveField(15)
  final num? special_attack;
  @HiveField(16)
  final num? special_defense;
  @HiveField(17)
  final num? speed;
  @HiveField(18)
  final num? total;
  @HiveField(19)
  final String? male_percentage;
  @HiveField(20)
  final String? female_percentage;
  @HiveField(21)
  final num? genderless;
  @HiveField(22)
  final String? cycles;
  @HiveField(23)
  final String? egg_groups;
  @HiveField(24)
  final String? evolvedfrom;

  PokemonModel(
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.special_attack,
    this.special_defense,
    this.speed,
    this.total,
    this.male_percentage,
    this.female_percentage,
    this.genderless,
    this.cycles,
    this.egg_groups,
    this.evolvedfrom,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
