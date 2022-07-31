import 'package:dio/dio.dart';
import 'package:kodestart_rickmorty/models/character.dart';
import 'package:kodestart_rickmorty/models/character_list.dart';

abstract class Repository {
  static final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  static Future<CharacterList> getCharacterList() async {
    final response = await _dio.get('/character');
    final data = CharacterList.fromJson(response.data);
    return data;
  }

  static Future<Character> getCharacter(int characterId) async {
    final reponse = await _dio.get('/character/$characterId');
    final data = Character.fromJson(reponse.data);
    return data;
  }
}
