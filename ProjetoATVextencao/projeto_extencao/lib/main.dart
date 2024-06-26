

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_extencao/telaCadastro.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginInp = TextEditingController();
  TextEditingController passInp = TextEditingController();

  String url = "http://10.109.83.4:3000/usuarios";

  var dados =[];

  _getUsers()async{
    http.Response resposta = await http.get(Uri.parse(url));
    dados = json.decode(resposta.body) as List;
    print(dados);

    bool encontrou = false;

    
    for (int i = 0; i<dados.length;)
    {
      if(loginInp.text == dados[i]["login"] && passInp.text == dados[i]["senha"]){
      encontrou = true;
      print("SenhaEncontrada");
      break;
      }
      i++;
    }
    if (encontrou == true) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaProdutos()));
      encontrou = false;
    }



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela De Login"),
        backgroundColor: Colors.red,
      ),
      body: ListView( 
        scrollDirection: Axis.vertical,
        children: [
          Container(height: 680, color: Colors.white,
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.asset("images/logo.png", width: 200,height: 200,),
                Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.group,size: 50,color: Colors.red,),
                      SizedBox(width: 300,
                        child: TextField(
                          keyboardType: TextInputType.name, // text field para o login
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,49, 101, 244)),
                              borderRadius: BorderRadius.circular(15)),
                            // focusedBorder: UnderlineInputBorder(
                            //  borderSide: BorderSide(color: Color.fromARGB(255,29, 99, 245))),
                            hintText: "Insira seu login",
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
                          controller: loginInp ,
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
                            hintText: "Insira sua Senha",
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
                          controller: passInp,
                          obscureText: true,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaCadastro()))
                ),
                ElevatedButton(onPressed: (){}, child: Text("OI"))
              ]
            ),
          )
        ],
      )
    );
  }
}