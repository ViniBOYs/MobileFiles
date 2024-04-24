import 'package:flutter/material.dart';

class TelaAddProdutos extends StatefulWidget {
  const TelaAddProdutos({super.key});

  @override
  State<TelaAddProdutos> createState() => _TelaAddProdutosState();
}

class _TelaAddProdutosState extends State<TelaAddProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela De Login"),
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
                      Icon(Icons.group,size: 50,color: Color.fromARGB(255,49, 101, 244),),
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
                          // controller: loginInp ,
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
                          // controller: passInp,
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
                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaCadastro()))
                ),
                ElevatedButton(onPressed: (){
                  // _getProdutos();
                }, 
                child: Text("Entrar")),
              ]
            ),
          )
        ],
      )
    );
  }
}