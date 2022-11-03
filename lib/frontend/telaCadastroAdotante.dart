import 'package:flutter/material.dart';

class telaCadastroAdotante extends StatefulWidget {
  const telaCadastroAdotante({super.key});

  @override
  State<telaCadastroAdotante> createState() => telaCadastroAdotanteState();

}

class telaCadastroAdotanteState extends State<telaCadastroAdotante> {
  
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  //endereco terá campos separados na tabela do usuário no banco, adicionar controllers posteriormente
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Adotante"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Dados pessoais", style: TextStyle(fontSize: 18),),

          ],
        ),
      ),
    );
  }
}