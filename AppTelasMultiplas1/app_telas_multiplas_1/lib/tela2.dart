import 'package:app_telas_multiplas_1/tela3.dart';
import 'package:flutter/material.dart';

class Telasecundaria extends StatelessWidget {
  const Telasecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body:
        Column(
          children: [
            Container(color: Colors.red, width: 400, height: 180,
            child: Text("Faz o L"),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Pedala")),
            ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Telatrez(),));
          }, child: Text("Tela 3"))
        ],
      )
    );
  }
}