import 'package:flutter/material.dart';
import 'package:flutter_05_material_cupertino/material_task_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MaterialTaskOne(),
    );
  }
}
