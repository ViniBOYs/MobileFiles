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
        body:        
          Container(
            // height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAxL3Jhd3BpeGVsb2ZmaWNlM19waG90b19vZl9ibGFja19nYWxheHlfc2ltcGxlX2JsYWNrX2JhY2tncm91bmRfYjQ5ODc5NTUtYjBiYy00ZjU3LTgyNDMtN2QyOTY3NWJkMmFkXzEuanBn.jpg"),
                    fit: BoxFit.cover),
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
                    Color.fromARGB(110, 33, 149, 243),
                    Color.fromARGB(40, 4, 96, 172),
                  ]),
                  
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Digite seu nome",
                        labelStyle: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                          ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,))
                        ),
                      style: TextStyle(color: Colors.amber)
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