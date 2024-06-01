import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  ImageGeneratorScreenState createState() => ImageGeneratorScreenState();
}

class ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _imageUrl;
  bool _isLoading = false;
  String? _error;

  Future<void> _generateImage() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final description = _controller.text;
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/images/generations'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer USE-YOUR-OWN-API-KEY',
      },
      body: json.encode({
        'prompt': description,
        'n': 1,
        'size': '1024x1024',
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _imageUrl = data['data'][0]['url'];
      });
    } else {
      setState(() {
        _error = 'Failed to generate image: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('DALL-E Image Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Image Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateImage,
              child: const Text('Generate Image'),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              )
            else if (_imageUrl != null)
              Image.network(_imageUrl!)
            else
              const Text(
                  'Enter a description and press the button to generate an image.'),
          ],
        ),
      ),
    );
  }
}
