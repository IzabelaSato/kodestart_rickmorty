import '../components/char_cad.dart';
import 'package:flutter/material.dart';
import '../components/app_bar_component.dart';
import 'package:kodestart_rickmorty/data/repository.dart';
import 'package:kodestart_rickmorty/pages/char_page.dart';
import 'package:kodestart_rickmorty/models/character_list.dart';
import 'package:kodestart_rickmorty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<CharacterList>? characters;

  @override
  void initState() {
    characters = Repository.getCharacterList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
          future: characters,
          builder: (_, AsyncSnapshot<CharacterList> snapshot) {
            if (snapshot.hasData) {
              final dataResults = snapshot.data!.results;

              return ListView.separated(
                itemBuilder: (_, index) {
                  final character = dataResults[index];
                  return CharCard(
                    character: character,
                    onTap: () => Navigator.of(context).pushNamed(
                      CharPage.routeId,
                      arguments: character.id,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: dataResults.length,
              );
            }
            return Container();
          }),
    );
  }
}
