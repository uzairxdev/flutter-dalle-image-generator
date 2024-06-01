import 'package:dall_e_image_generator/image_generator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DallEImageGeneratorApp());
}

class DallEImageGeneratorApp extends StatelessWidget {
  const DallEImageGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DALL-E Image Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageGeneratorScreen(),
    );
  }
}
