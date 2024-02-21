import 'package:app_telas_multiplas_1/tela5.dart';
import 'package:flutter/material.dart';

class telacontador extends StatefulWidget {
  const telacontador({super.key});

  @override
  State<telacontador> createState() => telacontadorState();
}

class telacontadorState extends State<telacontador> {
  int cont=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela contador"),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:  (context)=>campotexto()));
            }, child: Text("Campo Texto")),
            Center(
              child: Container(color: Colors.amber, width: 100, height: 100,
              child: Text("Contagem: " + "$cont",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),),
            ),
        // Botões de + e -
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              // set state atualiza o valor da variavel com a base no estado
              setState(() {
                cont++;
              });
            }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: (){
              setState(() {
                if (cont > 0) {
                  cont--;
                }            
              });
            }, child: Icon(Icons.remove)),
          ],
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            cont=0;
          });
        }, child: Icon(Icons.replay_outlined)),
        
        ],
      ),
    );
  }
}