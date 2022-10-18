import 'package:appadot/frontend/telaCadastro.dart';
import 'package:appadot/frontend/telaHome.dart';
import 'package:flutter/material.dart';

class telaLogin extends StatefulWidget {
  telaLogin({super.key});

  @override
  State<telaLogin> createState() => _telaLoginState();
}

class _telaLoginState extends State<telaLogin> {
  GlobalKey<FormState> _chaveForm = new GlobalKey();
  TextEditingController _usuarioController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();

  infoLogin(TextEditingController controller, String label, String hint,
      {bool obscure = false, validacao}) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      //validator: validacao,
      obscureText: obscure,
      style: TextStyle(
        color: Color(0xff734a26),
        fontSize: 22,
      ),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelStyle: TextStyle(color: Color(0xFF393e59), fontSize: 22),
          hintText: hint),
      validator: (texto) {
        if (texto!.isEmpty) {
          return "Campo Obrigatório";
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Efetuar Login"),
      ),
      body: SingleChildScrollView(
        key: _chaveForm,
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.account_circle,
              size: 90,
              color: Color(0xff734a26),
            ),
            const SizedBox(
              height: 10,
            ),
            infoLogin(_usuarioController, "Login", "Informe seu login"),
            const Divider(),
            infoLogin(_senhaController, "Senha", "Informe sua senha",
                obscure: true),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(178, 10, 178, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    backgroundColor: Color(0xff734a26)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => telaHome()));
                }),
            ElevatedButton(
                child: Text(
                  "Cadastrar-se",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    backgroundColor: Color(0xff734a26)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => telaCadastro()));
                })
          ],
        )),
      ),
    );
  }
}
// String _validaLogin(String text){
//       if(text.isEmpty){
//         return "Informe o login";
//       }
//       return _validaLogin(null!);
//   }
//   String _validaSenha(String text){
//       if(text.isEmpty){
//         return "Informe a senha";
//       }
//       return _validaSenha(null!);
//   }
