import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen/categories/categories_screen.dart';
import 'screen/quote/list_quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.bonaNovaTextTheme(textTheme).copyWith(
          // body1: GoogleFonts.oswald(textStyle: textTheme.body1),
        ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
