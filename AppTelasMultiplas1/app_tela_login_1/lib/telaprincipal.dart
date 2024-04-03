import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
      ),
      body: 
      Column(
        children: [
          Container(color: Colors.blue,width: 400, height: 100,
          child: Text("Gerador de Diamantes Free Fire 2024!",textAlign: TextAlign.center,style: TextStyle(fontSize: 39,color: Colors.white,),),),
          Image.asset('images\\diamantes-no-free-fire.jpg', width: 300,height: 200,),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Voltar para tela de Login"))
        ],
      )
    );
  }
}