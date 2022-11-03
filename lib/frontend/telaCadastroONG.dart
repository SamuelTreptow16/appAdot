import 'package:flutter/material.dart';

class telaCadastroONG extends StatefulWidget {
  const telaCadastroONG({super.key});

  @override
  State<telaCadastroONG> createState() => _telaCadastroONGState();
}

class _telaCadastroONGState extends State<telaCadastroONG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Protetor/ONG"),
      ),
    );
  }
}