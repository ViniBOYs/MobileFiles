import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/telaProdutos.dart';

class TelaAddProdutos extends StatefulWidget {
  const TelaAddProdutos({super.key});

  @override
  State<TelaAddProdutos> createState() => _TelaAddProdutosState();
}

class _TelaAddProdutosState extends State<TelaAddProdutos> {

  TextEditingController prodName = TextEditingController();
  TextEditingController prodPrice = TextEditingController();

  String url = "http://10.109.83.4:3000/produtos";

  _postProdutoNovo(){
    Map<String,dynamic>produtos={
      "nome":prodName.text.toString(),
      "valor": prodPrice.text.toString()
    };
    
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type':'application/json; charset=UTF-8',
      },
      body: jsonEncode(produtos),
    );
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela De Adicionar Produtos"),
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
                
                Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.production_quantity_limits,size: 50,color: Color.fromARGB(255,49, 101, 244),),
                      SizedBox(width: 300,
                        child: TextField(
                          keyboardType: TextInputType.name, // text field para o login
                          decoration: InputDecoration(
                            labelText: "Nome Produto",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,49, 101, 244)),
                              borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,29, 99, 245),width: 3),
                              borderRadius: BorderRadius.circular(5)),
                            hintText: "Insira o Nome do Produto",
                            border: OutlineInputBorder(    
                              borderRadius: BorderRadius.circular(5) // borda do TextField
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255,9, 121, 176),
                              // fontWeight: FontWeight.w600,
                              fontSize: 20
                            ),
                          ),
                          style: TextStyle(color: Color.fromARGB(255,9, 121, 176),fontWeight: FontWeight.bold),
                          controller: prodName ,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.attach_money,size: 50,color: Color.fromARGB(255,49, 101, 244),),
                      SizedBox(width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number, // text field para o login
                          decoration: InputDecoration(
                            labelText: "Valor do Produto",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,49, 101, 244),),
                              borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,29, 99, 245),width: 3)),
                            border: OutlineInputBorder(    
                              borderRadius: BorderRadius.circular(5) // borda do TextField
                            ),
                            hintText: "Insira o Nome do Produto",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255,9, 121, 176),
                              // fontWeight: FontWeight.w600,
                              fontSize: 20
                            ),
                          ),
                          style: TextStyle(color: Color.fromARGB(255,9, 121, 176),fontWeight: FontWeight.bold),
                          controller: prodPrice ,
                        ),
                      ),
                    ],
                  ),
                ),               
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  _postProdutoNovo();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaProdutos()));
                }, 
                child: Text("Enviar Produto")),
              ]
            ),
          )
        ],
      )
    );
  }
}