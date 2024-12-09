import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  HelloPageState createState() => HelloPageState();
}

class HelloPageState extends State<HelloPage> {
  String? _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name (no number)',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final result = await client.example
                          .hello(_textEditingController.text);
                      setState(() {
                        _errorMessage = null;
                        _resultMessage = result;
                      });
                    } catch (e) {
                      setState(() {
                        _errorMessage = '$e';
                      });
                    }
                  },
                  child: const Text('Send to Server'),
                ),
              ),
            ),
            _ResultDisplay(
              resultMessage: _resultMessage,
              errorMessage: _errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 250,
      width: double.infinity,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
