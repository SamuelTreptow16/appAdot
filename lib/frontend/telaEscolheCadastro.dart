import 'package:appadot/frontend/telaCadastroAdotante.dart';
import 'package:appadot/frontend/telaCadastroONG.dart';
import 'package:appadot/frontend/telaCadastroServicos.dart';
import 'package:flutter/material.dart';

class telaEscolheCadastro extends StatefulWidget {
  const telaEscolheCadastro({super.key});

  @override
  State<telaEscolheCadastro> createState() => _telaEscolheCadastroState();
}

class _telaEscolheCadastroState extends State<telaEscolheCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Onde você se encaixa?"),
      // ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Image.asset(
            'assets/images/logoapptcc5.png',
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const telaCadastroAdotante()));
            },
            child: Text("Adotante", style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(120, 8, 116, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const telaCadastroONG()));
              },
              child: Text("Protetor/ONG", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(100, 8, 100, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)))),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const telaCadastroServicos()));
              },
              child: Text("Serviços", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(120, 8, 120, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))))
              ],),
          )
        ],
      )),
    );
  }
}
