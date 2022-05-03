import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {Navigator.pop(context)},
          child: const Text("Go Back!"),
        ),
      ),
    );
  }
}
