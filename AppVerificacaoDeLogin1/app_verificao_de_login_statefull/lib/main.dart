import 'package:flutter/material.dart';

void main() {
  runApp(Telaprincipal());
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tela Aplicativo Dinamico"),
          ),
        body: Column(
            children: [
              Contador()
            ],
          ),
        ),
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int cont=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.blue,
                height: 200,
                width: 200,
                child: Text("${cont}",style: TextStyle(fontSize: 32),),
              ),
              ElevatedButton(onPressed: (){
                  setState(() {
                    cont++;
                  });
                }, 
                child: Text("Let's Go")),
              ElevatedButton(onPressed: (){
                  setState(() {
                    cont=0;
                  });
                }, 
                child: Text("zeraTUdo"))
            ],
          ),
            
        ],
      ),
    );
  }
}