import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initializing the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("sndpbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
