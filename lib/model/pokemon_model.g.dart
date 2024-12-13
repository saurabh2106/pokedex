// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 1;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      (fields[8] as List?)?.cast<String>(),
      (fields[9] as List?)?.cast<String>(),
      (fields[10] as List?)?.cast<String>(),
      (fields[11] as List?)?.cast<String>(),
      fields[12] as num?,
      fields[13] as num?,
      fields[14] as num?,
      fields[15] as num?,
      fields[16] as num?,
      fields[17] as num?,
      fields[18] as num?,
      fields[19] as String?,
      fields[20] as String?,
      fields[21] as num?,
      fields[22] as String?,
      fields[23] as String?,
      fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageurl)
      ..writeByte(3)
      ..write(obj.xdescription)
      ..writeByte(4)
      ..write(obj.ydescription)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.typeofpokemon)
      ..writeByte(9)
      ..write(obj.weaknesses)
      ..writeByte(10)
      ..write(obj.evolutions)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.hp)
      ..writeByte(13)
      ..write(obj.attack)
      ..writeByte(14)
      ..write(obj.defense)
      ..writeByte(15)
      ..write(obj.special_attack)
      ..writeByte(16)
      ..write(obj.special_defense)
      ..writeByte(17)
      ..write(obj.speed)
      ..writeByte(18)
      ..write(obj.total)
      ..writeByte(19)
      ..write(obj.male_percentage)
      ..writeByte(20)
      ..write(obj.female_percentage)
      ..writeByte(21)
      ..write(obj.genderless)
      ..writeByte(22)
      ..write(obj.cycles)
      ..writeByte(23)
      ..write(obj.egg_groups)
      ..writeByte(24)
      ..write(obj.evolvedfrom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      json['name'] as String?,
      json['id'] as String?,
      json['imageurl'] as String?,
      json['xdescription'] as String?,
      json['ydescription'] as String?,
      json['height'] as String?,
      json['category'] as String?,
      json['weight'] as String?,
      (json['typeofpokemon'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['hp'] as num?,
      json['attack'] as num?,
      json['defense'] as num?,
      json['special_attack'] as num?,
      json['special_defense'] as num?,
      json['speed'] as num?,
      json['total'] as num?,
      json['male_percentage'] as String?,
      json['female_percentage'] as String?,
      json['genderless'] as num?,
      json['cycles'] as String?,
      json['egg_groups'] as String?,
      json['evolvedfrom'] as String?,
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageurl,
      'xdescription': instance.xdescription,
      'ydescription': instance.ydescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'typeofpokemon': instance.typeofpokemon,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.special_attack,
      'special_defense': instance.special_defense,
      'speed': instance.speed,
      'total': instance.total,
      'male_percentage': instance.male_percentage,
      'female_percentage': instance.female_percentage,
      'genderless': instance.genderless,
      'cycles': instance.cycles,
      'egg_groups': instance.egg_groups,
      'evolvedfrom': instance.evolvedfrom,
    };
