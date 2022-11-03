import 'package:flutter/material.dart';

class telaCadastroServicos extends StatefulWidget {
  const telaCadastroServicos({super.key});

  @override
  State<telaCadastroServicos> createState() => _telaCadastroServicosState();
}

class _telaCadastroServicosState extends State<telaCadastroServicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Serviços"),
      ),
    );
  }
}