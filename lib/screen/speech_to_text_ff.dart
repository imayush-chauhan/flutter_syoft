import 'package:flutter/material.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';

class SpeechToTextFF extends StatefulWidget {
  const SpeechToTextFF({Key? key}) : super(key: key);

  @override
  _SpeechToTextFFState createState() => _SpeechToTextFFState();
}

class _SpeechToTextFFState extends State<SpeechToTextFF> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      'result=${result ?? ''}',
                      textAlign: TextAlign.center,
                    ))),
            ElevatedButton(
              onPressed: () async {
                bool isServiceAvailable =
                await SpeechToTextGoogleDialog.getInstance()
                    .showGoogleDialog(onTextReceived: (data) {
                  setState(() {
                    result = data.toString();
                  });
                });
                if (!isServiceAvailable) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Service is not available'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 16,
                      right: 16,
                    ),
                  ));
                }
              },
              child: const Text('show dialog'),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}