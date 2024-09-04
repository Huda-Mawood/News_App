import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class ErrorDemoPage extends StatefulWidget {
  const ErrorDemoPage({super.key});

  @override
  ErrorDemoPageState createState() => ErrorDemoPageState();
}

class ErrorDemoPageState extends State<ErrorDemoPage> {
  @override
  void dispose() {
    // Intentionally not calling super.dispose() to cause the error
    // This is just for demonstration purposes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispose Error Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error: This page intentionally causes a dispose error.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text.rich(
              TextSpan(
                text: 'The error occurs because the dispose() method in the '
                    'state class does not call ',
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'super.dispose()',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: ', which is necessary to properly clean up resources. '
                        'The State class has a default implementation of the dispose() method that may handle some internal cleanup tasks. When you override dispose() in your own class, you must call ',
                  ),
                  TextSpan(
                    text: 'super.dispose()',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: ' to ensure that the parent class\'s dispose() method runs, thereby properly releasing all resources.',
                  ),
                  TextSpan(
                    text: 'one more thing if you try passing word GENERAL as parameter to get general news u will got dio exption ',
                  ),
                  TextSpan(
                    text: 'because there is no geranial news in this endpoint',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeView();
                }));
              },
              child: const Text('Go Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
