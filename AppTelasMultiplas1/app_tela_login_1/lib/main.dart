import 'dart:ffi';

import 'package:app_tela_login_1/telaprincipal.dart';
import 'package:flutter/material.dart';
TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();
String login = "viniboy@email.com";
String keypass = "12345";

void main() {
  runApp(MaterialApp(
    home: TelaLogin(),
  ));
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
      ),
      body: 
      Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "Insira o e-mail"),
            controller: _user,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Insira a senha"),
            obscureText: true,
            obscuringCharacter: "*",
            controller: _pass, 
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  if (_user.text == login && _pass.text == keypass) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainScreen()));
                    print(_user.text);
                    print(_pass.text);
                  } else {
                    print("Erro");
                    print(_user.text);
                    print(_pass.text);
                  }
                }, child: Text("Enviar")),
                Container(width: 50, height: 100,),
                ElevatedButton(onPressed: (){
                  _user.text = "";
                  _pass.text = "";
                }, child: Text("Limpar"))
              ],
            )
        ],
      ),
    );
  }
}
