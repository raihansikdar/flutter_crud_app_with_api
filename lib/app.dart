import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/screen/home_page.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 2),
            )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade200),
      ),
      home: const HomePage(),
    );
  }
}
