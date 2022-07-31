import '../models/character.dart';
import 'package:flutter/material.dart';
import '../components/char_detail_card.dart';
import 'package:kodestart_rickmorty/data/repository.dart';
import 'package:kodestart_rickmorty/theme/app_colors.dart';
import 'package:kodestart_rickmorty/components/app_bar_component.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class CharPage extends StatefulWidget {
  static const routeId = '/character';
  final int characterId;
  const CharPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  Future<Character>? character;

  @override
  void initState() {
    character = Repository.getCharacter(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<Character>(
        future: character,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return CharDetailCard(charDetail: data);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error has occured',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
