import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/views/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dominick's Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.sourceCodeProTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
