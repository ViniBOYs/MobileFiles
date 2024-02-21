import 'package:app_telas_multiplas_1/tela4.dart';
import 'package:flutter/material.dart';

class Telatrez extends StatelessWidget {
  const Telatrez({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 3"),
      ),
      body:
        Column(
          children: [
            Container(color: Colors.purple, width: 400, height: 180,
            child: Text("Faz o L"),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Pedala")),
            ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => telacontador(),));
          }, child: Text("Tela contador"))
        ],
      )
    );
  }
}