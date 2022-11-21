import 'package:appadot/frontend/telaLogin.dart';
import 'package:flutter/material.dart';

class telaHome extends StatefulWidget {
  const telaHome({super.key});

  @override
  State<telaHome> createState() => _telaHomeState();
}

class _telaHomeState extends State<telaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
        actions: [
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => telaLogin()));
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const telaBemVindo()));
              },
            )
          ]
      ),
    );
  }
}