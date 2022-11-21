import 'dart:math';

import 'package:appadot/frontend/telaLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class telaCadastroONG extends StatefulWidget {
  const telaCadastroONG({super.key});

  @override
  State<telaCadastroONG> createState() => _telaCadastroONGState();
}

class _telaCadastroONGState extends State<telaCadastroONG> {

  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _razaoSocialController = TextEditingController();
  TextEditingController _nomeFantasiaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();

  infoONG(TextEditingController controller, String label, String hint,
      {bool obscure = false, TextInputType? keyboardType}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatório";
        }
        return null;
      },
      autofocus: true,
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          hintText: hint),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Cadastro de Protetor/ONG"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12,),
            Text("Dados Cadastrais", style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 12,),
            infoONG(_cnpjController, "CNPJ", "Insira o CNPJ da ONG", keyboardType: TextInputType.number, ),
            const SizedBox(height: 15,),
            infoONG(_razaoSocialController, "Razão Social", "Digite sua razão social", keyboardType: TextInputType.name),
            const SizedBox(height: 15,),
            infoONG(_nomeFantasiaController, "Nome Fantasia", "Informe o nome fantasia", keyboardType: TextInputType.name),
            const SizedBox(height: 15,),
            infoONG(_emailController, "E-mail", "Informe seu e-mail", keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 15,),
            infoONG(_senhaController, "Senha", "Informe sua senha", obscure: true,),
            const SizedBox(height: 15,),
            infoONG(_enderecoController, "Endereço", "Informe seu endereço", keyboardType: TextInputType.streetAddress),
            const SizedBox(height: 15,),
            infoONG(_telefoneController, "Telefone", "Informe seu telefone de contato", keyboardType: TextInputType.phone,),
            const SizedBox(height: 25,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => telaLogin()));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Cadastro Efetuado com Sucesso")));
              },
              child: Text("Efetuar Cadastro", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(120, 8, 116, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            const SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}