import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  TextEditingController userInp = TextEditingController();
  TextEditingController passwordInp = TextEditingController();
  
  String url = "http://10.109.83.4:3000/usuarios";

  _post(){
    Map<String,dynamic>usuarios={
      "login":"${userInp.text}",
      "senha": "${passwordInp.text}"
    };
    
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type':'application/json; charset=UTF-8',
      },
      body: jsonEncode(usuarios),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela De Cadastro"),
        backgroundColor: Color.fromARGB(255,49, 101, 244),
      ),
      body: ListView( 
        scrollDirection: Axis.vertical,
        children: [
          Container(height: 680, color: Color.fromARGB(250,205, 255, 255),
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("images/user_screen.png", width: 200,height: 200,),
                SizedBox(height: 50,),
                Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.group_add,size: 50,color: Color.fromARGB(255,49, 101, 244),),
                      SizedBox(width: 300,
                        child: TextField(
                          keyboardType: TextInputType.name, // text field para o login
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,49, 101, 244)),
                              borderRadius: BorderRadius.circular(15)),
                            hintText: "Novo Usuário",
                            border: OutlineInputBorder(    
                              borderRadius: BorderRadius.circular(5) // borda do TextField
                            ),
                            labelStyle: TextStyle(
                              backgroundColor:Colors.white,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          style: TextStyle(color: Color.fromARGB(255,9, 121, 176),fontWeight: FontWeight.bold),
                          controller: userInp
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.key,size: 50,color: Color.fromARGB(255,49, 101, 244),),
                      SizedBox(width: 300,
                        child: TextField(
                          keyboardType: TextInputType.name, // text field para o login
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,29, 99, 245)),
                              borderRadius: BorderRadius.circular(15)),
                            // focusedBorder: UnderlineInputBorder(
                            //  borderSide: BorderSide(color: Color.fromARGB(255,29, 99, 245))),
                            hintText: "Senha",
                            border: OutlineInputBorder(    
                              borderRadius: BorderRadius.circular(5) // borda do TextField
                            ),
                            labelStyle: TextStyle(
                              backgroundColor:Colors.white,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          style: TextStyle(color: Color.fromARGB(255,9, 121, 176),fontWeight: FontWeight.bold),
                          controller: passwordInp ,
                          obscureText: true,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  _post();
                }, child: Text("Cadastrar")),
                Text("${userInp.text}")
              ]
            ),
          )
        ],
      )
    );
  }
}