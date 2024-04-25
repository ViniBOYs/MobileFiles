import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/telaAddProduto.dart';

class TelaProdutos extends StatefulWidget {
  const TelaProdutos({super.key});

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}



class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json["id"],json["nome"],json["valor"]);

  }  
}
class Produto_n{
  List prod =[];
  Produto_n(this.prod);
}


class _TelaProdutosState extends State<TelaProdutos> {

  String url = "http://10.109.83.4:3000/produtos";
  List dados = [];
  var produtos = <Produto>[];

  _getProdutos()async{
    http.Response resposta = await http.get(Uri.parse(url));
    dados = json.decode(resposta.body) as List;
    print(dados);

    setState(() {
      produtos = dados.map((json) => Produto.fromJson(json)).toList();
    });
  }


  

  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    _getProdutos();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela De Produtos"),
        backgroundColor: Color.fromARGB(255,49, 101, 244),
      ),
      body: ListView( 
        scrollDirection: Axis.vertical,
        children: [
          Container(height: 680, color: Color.fromARGB(250,205, 255, 255),
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Image.asset("images/caixa_lupa.png")),
                InkWell(
                  child: Text(
                    'Cadastrar novo Produto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      backgroundColor: Color.fromARGB(50, 49, 101, 244)
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaAddProdutos()))
                ), SizedBox(height: 20,),
                Column(
                  children:produtos.map((produto)=>Text("${produto.nome} - R\$ ${produto.valor}",
                  style: TextStyle(fontSize: 18),)).toList(),
                )
              ]
            ),
          )
        ],
      )
    );
  }
}