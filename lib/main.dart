import 'package:flutter/material.dart';
import 'package:flutter_ui/screen/credit_slider.dart';
import 'package:flutter_ui/screen/image_circle.dart';
import 'package:flutter_ui/screen/speech_to_text_ff.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Circle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CreditSlider(
        total: 10000,
        used: 6759,
      ),
    );
  }
}
