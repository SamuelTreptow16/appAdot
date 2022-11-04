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

  infoAdotante(TextEditingController controller, String label, String hint,
      {bool obscure = false}) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      obscureText: obscure,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelStyle: TextStyle(color: Colors.black, fontSize: 22),
          hintText: hint),
      validator: (texto) {
        if (texto!.isEmpty) {
          return "Campo Obrigatório";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Adotante"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12,),
            Text("Dados pessoais", style: TextStyle(fontSize: 20,), textAlign: TextAlign.left,),
            SizedBox(height: 12,),
            infoAdotante(_emailController, "E-mail", "Informe seu e-mail"),
            SizedBox(height: 15,),
            infoAdotante(_usuarioController, "Usuário", "Informe seu nome de usuário"),
            //continuar fazendo campos de inserção de dados
          ],
        ),
      ),
    );
  }
}