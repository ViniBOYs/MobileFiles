import 'package:flutter/material.dart';

void main() {
  runApp(Campotexto());
}

class Campotexto extends StatefulWidget {
  const Campotexto({super.key});

  @override
  State<Campotexto> createState() => _CampotextoState();
}

class _CampotextoState extends State<Campotexto> {
  TextEditingController campo_nome = TextEditingController();
  TextEditingController campo_senha = TextEditingController();
  bool authorized = false;
  String? valor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("App Caixa de Texto"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // campo que permite 
              TextField(
                // tipo de teclado
                keyboardType: TextInputType.name, //seleciona o tipo de entrada do campo de texto
                decoration: InputDecoration(
                  labelText: "Digite seu email"),
                  /*onChanged: (String texto){
                      print(texto);}*/
                  controller: campo_nome, //variavel que armazena o que é digitado no campo
              ),
              TextField(
                // tipo de teclado
                keyboardType: TextInputType.name, //seleciona o tipo de entrada do campo de texto
                decoration: InputDecoration(
                  labelText: "Digite sua senha"),
                  /*onChanged: (String texto){
                      print(texto);}*/
                  controller: campo_senha, //variavel que armazena o que é digitado no campo
              ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    campo_nome.text = "";
                  });

                }, child: Text("Limpar")),
                ElevatedButton(onPressed: (){
                  print("${campo_nome.text}");
                  setState(() {
                    if (campo_nome.text == "Vini" && campo_senha.text == "123"){
                      authorized = true;
                      print("Access Authorized");
                    }else{
                      authorized = false;
                      print("Access Denied");
                    }
                    valor = campo_nome.text;
                    print(valor); 
                  });
                }, child: Text("Verificar")),
                Container(
                  color: Colors.blue,
                  height: 200,
                  width: 200,
                  child: Text("${campo_nome.text}", 
                            style: TextStyle(fontSize: 25), 
                            textAlign: TextAlign.center
                            ),
                ),
            ] 
          ),
      ),
    );
  }
}