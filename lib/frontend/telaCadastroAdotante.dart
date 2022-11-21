import 'package:appadot/frontend/telaLogin.dart';
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
      {bool obscure = false, TextInputType? keyboardType}) {
    return TextFormField(
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
      validator: (texto) {
        if (texto!.isEmpty) {
          return "Campo Obrigatório";
        }
      },
    );
  }

  String _opcao1 = "Sim";
  String _opcao2 = "Casa";
  String _opcao3 = "Sim";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Adotante"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12,),
            const Text("Dados pessoais", style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 12,),
            infoAdotante(_emailController, "E-mail", "Informe seu e-mail", keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 15,),
            infoAdotante(_usuarioController, "Usuário", "Informe seu nome de usuário"),
            const SizedBox(height: 15,),
            infoAdotante(_senhaController, "Senha", "Insira sua senha", obscure: true),
            const SizedBox(height: 15,),
            infoAdotante(_cpfController, "CPF", "Insira seu CPF", keyboardType: TextInputType.number),
            const SizedBox(height: 15,),
            infoAdotante(_enderecoController, "Endereço", "Insira seu endereço completo", keyboardType: TextInputType.streetAddress),
            const SizedBox(height: 15,),
            infoAdotante(_telefoneController, "Telefone", "Insira seu número de telefone", keyboardType: TextInputType.phone),
            const SizedBox(height: 25,),

            //Row animais em casa
            const Text("Você tem outros animais em casa?", style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 80,),
                Radio(value: "Sim", groupValue: _opcao1, onChanged: (value) {
                  setState(() {
                    _opcao1 = value.toString();
                  });
                }),
                Text("Sim", style: TextStyle(fontSize: 18)),
                SizedBox(width: 70,),
                Radio(value: "Não", groupValue: _opcao1, onChanged: (value) {
                  setState(() {
                    _opcao1 = value.toString();
                  });
                }),
                Text("Não", style: TextStyle(fontSize: 18),),
              ],
            ),
            
            //Row casa ou apartamento
            SizedBox(height: 10,),
            Text("Você mora em casa ou AP?", style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 80,),
                Radio(value: "Casa", groupValue: _opcao2, onChanged: (value) {
                  setState(() {
                    _opcao2 = value.toString();
                  });
                }),
                Text("Casa", style: TextStyle(fontSize: 18)),
                SizedBox(width: 63,),
                Radio(value: "AP", groupValue: _opcao2, onChanged: (value) {
                  setState(() {
                    _opcao2 = value.toString();
                  });
                }),
                Text("AP", style: TextStyle(fontSize: 18)),
              ],
            ),

            //Row crianças em casa
            SizedBox(height: 10,),
            Text("Tem crianças na sua casa?", style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 80,),
                Radio(value: "Sim", groupValue: _opcao3, onChanged: (value) {
                  setState(() {
                    _opcao3 = value.toString();
                  });
                }),
                Text("Sim", style: TextStyle(fontSize: 18)),
                SizedBox(width: 63,),
                Radio(value: "Não", groupValue: _opcao3, onChanged: (value) {
                  setState(() {
                    _opcao3 = value.toString();
                  });
                }),
                Text("Não", style: TextStyle(fontSize: 18)),
              ],
            ),
            
            const SizedBox(height: 10,),
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
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}