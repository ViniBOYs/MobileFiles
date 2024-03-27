import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App aula 08 exemplo"),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          width:500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 4, 96, 172),
                Colors.blue,
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              Container(width: 300,height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  const Color.fromARGB(255, 4, 96, 172),
                ]),
                
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: "Digite seu nome"),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Digite sua senha"),
                    obscureText: true,
                    // obscuringCharacter: '#', // modifica o que vai esconder os caracteres
                  ),
                  ElevatedButton(onPressed: (){}, child: Icon(Icons.account_circle_rounded)),
                 
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}