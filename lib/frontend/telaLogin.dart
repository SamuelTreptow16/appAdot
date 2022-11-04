import 'package:appadot/frontend/telaCadastroAdotante.dart';
import 'package:appadot/backend/usuarioHelper.dart';
import 'package:appadot/backend/sistema.dart';
import 'package:appadot/frontend/telaEscolheCadastro.dart';
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
  bool mostraMsg = false;

  infoLogin(TextEditingController controller, String label, String hint,
      {bool obscure = false}) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      obscureText: obscure,
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Efetuar Login"),
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        key: _chaveForm,
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset('assets/images/logoapptcc5.png', height: 200),
            Text("Bem-Vindo!",  style: TextStyle(fontSize: 24, color: Colors.black),),
            Text("Para continuar, efetue seu login", style: TextStyle(fontSize: 16),),
            const SizedBox(
              height: 25,
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
                    backgroundColor: Color(0xffEDB640)),
                onPressed: () async {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => telaHome()));
                  if (_chaveForm.currentState!.validate()) {
                        sistema.usuarioLogado = await UsuarioHelper().login(
                            _usuarioController.text, _senhaController.text);
                        if (sistema.usuarioLogado.id > 0) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const telaHome()));
                        } else {
                          mostraMsg = true;
                          setState(() {});
                        }
                      }
                }),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(55, 0, 0, 0)),
                    Text("Ainda não possui cadastro?", style: TextStyle(fontSize: 16),),
                    TextButton(onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => telaEscolheCadastro()));
                    }, child: Text("Cadastre-se", style: TextStyle(fontSize: 16))),
                  ],
                )
            // ElevatedButton(
            //     child: Text(
            //       "Cadastrar-se",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //         padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18)),
            //         backgroundColor: Color(0xff734a26)),
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => telaEscolheCadastro()));
            //     })
          ],
        )),
      ),
    );
  }
}