import 'package:ecommerce_app1/admin.dart';
import 'package:ecommerce_app1/clientPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  int isAdmin = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App E-COMMERCE"),
          backgroundColor: Colors.purple,
        ),
        body:        
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.red,
                      ]),
                      
                    // image: DecorationImage(
                    //     image: NetworkImage("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAxL3Jhd3BpeGVsb2ZmaWNlM19waG90b19vZl9ibGFja19nYWxheHlfc2ltcGxlX2JsYWNrX2JhY2tncm91bmRfYjQ5ODc5NTUtYjBiYy00ZjU3LTgyNDMtN2QyOTY3NWJkMmFkXzEuanBn.jpg"),
                    //     fit: BoxFit.cover),
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('img/Logo.png',width: 400,height:200,),
                    // Container(width: 200,height: 200,color: Colors.amber,),
                    SizedBox(width: 300,height: 400, //ImputBox
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.asset(),
                        TextField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Digite seu nome",
                            labelStyle: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                              ),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                            ),
                          style: TextStyle(color: Colors.orange[600],fontWeight: FontWeight.bold),
                          controller: nome,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Digite sua senha",
                            labelStyle: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                              ),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                            ),
                          obscureText: true,
                          style: TextStyle(color: Colors.white,fontSize: 20 ),
                          controller: senha,
                          // obscuringCharacter: '#', // modifica o que vai esconder os caracteres
                        ),
                        // TextField(
                        //   keyboardType: TextInputType.name,
                        //   decoration: InputDecoration(border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)
                        //   ),labelStyle: TextStyle(backgroundColor: Colors.white)),
                        // ),
                        Container(width: double.infinity,height: 100, // 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(width: 110, height: 50,
                            child: Row(
                              children: [
                                Radio<int>(
                                value: 1,
                                groupValue: isAdmin,
                                activeColor: Colors.red, // Change the active radio button color here
                                fillColor: MaterialStateProperty.all(Colors.white), // Change the fill color when selected
                                splashRadius: 20, // Change the splash radius when clicked
                                onChanged: (value) {
                                  setState(() {
                                    isAdmin = 1;
                                  });},
                                ),Text("Admin",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.blueGrey[50])),
                              ]),
                            ),
                            Container(width: 120, height: 50,
                            child: Row(
                              children: [
                                Radio<int>(
                                value: 0,
                                groupValue: isAdmin,
                                activeColor: Colors.white,
                                fillColor: MaterialStateProperty.all(Colors.white),
                                splashRadius: 20, 
                                onChanged: (value) {
                                  setState(() {
                                    isAdmin = 0;
                                  });},
                              ),Text("Cliente",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.blueGrey[50]))
                              ])
                            ),],),
                        ),                    
                        // Text("$isAdmin"),
  
                        ElevatedButton(onPressed: (){
                          setState(() {
                            if (isAdmin == 1 && nome.text=="ViniBOY" && senha.text=="123456"){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => adminHomePage()));
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => clietHomePage()));
                            } 
                          });                      
                        }, child: Text("Entrar")),
                      ],
                    ),
                  )
                ],
              ),
        ),
            ],
          ),
      ),
    );
  }
}

