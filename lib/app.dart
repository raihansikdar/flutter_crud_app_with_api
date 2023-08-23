import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/network/network_component/controller_binding.dart';
import 'package:flutter_crud_app_with_api/views/home_page.dart';
import 'package:get/get.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindling(),
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 2),
            )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade200),
      ),
      home:  HomePage(),
    );
  }
}
