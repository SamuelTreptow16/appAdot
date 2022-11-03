import 'telaLogin.dart';
import 'package:flutter/material.dart';

class telaBemVindo extends StatefulWidget {
  const telaBemVindo ({super.key});

  @override
  State<telaBemVindo > createState() => _telaBemVindo ();
}

class _telaBemVindo extends State<telaBemVindo > {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    avancarTelaBemVindo();
  }

  void avancarTelaBemVindo() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => telaLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logoapptcc.png')
        ],
      ),
      );
  }
}