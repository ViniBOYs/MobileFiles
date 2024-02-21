import 'package:flutter/material.dart';
TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();
class campotexto extends StatelessWidget {
  const campotexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo Texto"),
      ),
      body: 
        Column(
          children: [
            // Textfiel é o campo de texto
            TextField(
              // keyboard type é o tipo de entrada do campo texto
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: _user,
            ),
            TextField(
              // keyboard type é o tipo de entrada do campo texto
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite a senha"),
              obscureText: true,
              obscuringCharacter: "*",
              controller: _pass,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  print(_user.text);
                  print(_pass.text);
                }, child: Text("Exibir")),
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