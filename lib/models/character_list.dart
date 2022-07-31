import 'character.dart';

class CharacterList {
//  final Info info;
  final List<Character> results;
  CharacterList({
//    required this.info,
    required this.results,
  });

  factory CharacterList.fromJson(Map<String, dynamic> json) {
    return CharacterList(
//      info: Info.fromJson(json['info']),
      results:
          List.from(json['results']).map((e) => Character.fromJson(e)).toList(),
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
