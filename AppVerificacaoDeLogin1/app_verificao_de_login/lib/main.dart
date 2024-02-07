import 'package:flutter/material.dart';

void main() {
  Home();
}

class Home extends StatelessWidget {
  const Home({super.key});

//  override permite a reescrita de funções na classe
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // Scaffold layout semi pronto do aplicativo
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplicativo aula 02"),
        ),
        body: Center(
          child: Column(
              // configurar alinhamento principal do app
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Container(
            color: Colors.blueAccent,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          )
              ],
            ),
        ),
    )
    );
  }
}