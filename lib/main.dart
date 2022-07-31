import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodestart_rickmorty/pages/char_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kode Start: Rick & Morty',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            );
          case CharPage.routeId:
            final args = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) {
                return CharPage(
                  characterId: args,
                );
              },
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      //home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
