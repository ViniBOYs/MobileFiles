import 'package:app_telas_multiplas_1/tela2.dart';
import 'package:app_telas_multiplas_1/tela3.dart';
import 'package:flutter/material.dart';

void main() {
  // runAPP função que controi a tela do app
  // MaterialAPP função widget para Android
  // home parametro inicial para chamar a tela
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));

}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo aula 03"),
    ),
    body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.blue, width: 400, height: 180,
          child: Text("Tela 1", style: TextStyle(fontSize: 25),),),
          // child é a relação com 1 widget
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Telasecundaria(),));
          }, child: Text("Tela 2")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Telatrez(),));
          }, child: Text("Tela 3"))
        ],
        
      ),
    );
  }
}