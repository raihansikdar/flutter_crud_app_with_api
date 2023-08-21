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
        inputDecorationTheme:  InputDecorationTheme(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 2),
            ),
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.025,
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade200),
      ),
      home: const HomePage(),
    );
  }
}
