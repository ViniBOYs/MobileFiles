import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // permite os methods http
import 'dart:convert'; //pacote que permite a conversão dos dados

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController _cep = TextEditingController();
  String ? logradouro;
  String ? bairro;
  String ? cidade;
  String ? estado;
  String ? ddd;
  @override

class _HomeState extends State<Home> {
  
  bool tapped = false;
  double size = 150;
  double fontSize = 20;
  final duration = const Duration(milliseconds: 300);
  
  _consultaCep () async {
    String url = "https://cep.awesomeapi.com.br/${_cep.text}";
    // api para consultar o endereço atraves do cep
    http.Response response; // Varoaveç para armazenar a resposta da API
    response = await http.get(Uri.parse(url));
    print("Codigo de status da API: ${response.statusCode.toString()}");
    print("Resposta da api ${response.body}");

    Map<String,dynamic>dados = json.decode(response.body); // responsavel para armazenar os dados da api
    setState(() {
      logradouro = dados["address"];
      bairro = dados["district"];
      cidade = dados["city"];
      estado = dados["state"];
      ddd = dados["ddd"];
    });
    
    print("logradouro $logradouro");
    print("bairro $bairro");
    print("cidade $cidade");
    print("estado $estado");
    print("ddd $ddd");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App comsulta CEP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Insra o CEP desejado",
            ),
            keyboardType: TextInputType.number,
            controller: _cep,
          ),
          ElevatedButton(onPressed: _consultaCep, child: Text("Verificar")),
          ElevatedButton(onPressed: () => setState(() => tapped = !tapped), 
          child: Text(
            tapped ? 'fechar' : 'abrir'
            )),
          
          
          
          AnimatedOpacity(
              opacity: tapped ? 1 : 0,
              duration: duration,
              child: Container( 
              padding: EdgeInsets.all(10), // cria uma pequena borda
              height: MediaQuery.of(context).size.height*0.5, // regula a altura do bloco
              width: double.infinity, // define a largura como infinita
              color: Colors.white,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      ), 
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 20),
                      Container(width: 300,height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5.0)),
                      child: Center(child: Text("logradouro $logradouro",textAlign: TextAlign.center,)),
                      ),
                      Container(width: 300,height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5.0)),
                      child: Center(child: Text("bairro $bairro")),
                      ),
                      Container(width: 300,height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5.0)),
                      child: Center(child: Text("cidade $cidade")),
                      ),
                      Container(width: 300,height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5.0)),
                      child: Center(child: Text("estado $estado")),
                      ),
                      Container(width: 300,height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5.0)),
                      child: Center(child: Text("ddd $ddd")),
                      ),
                      Container(height: 20),
                    ]),
                  )
                ),
              ),
        ]
      ),
    );
  }
}
