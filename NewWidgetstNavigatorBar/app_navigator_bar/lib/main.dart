import 'package:flutter/material.dart'; // Pacote para o sistema operacional android

// função principal
void main() {
  // Run app é a função que vai chamar a tela do aplicativo
  runApp( NavBottom()); // Material APP é a função necessária para chamar a classe criada
}
// Classe NavBottom do tipo stateless, pois não tem widgets dinamicos
class NavBottom extends StatelessWidget {
  const NavBottom({super.key}); // construtor
 
  @override
  Widget build(BuildContext context) {
    // Scaffold é o layout semipronto do aplicativo
    return MaterialApp(
      home:   // app bar é a barra do aplicativo
                
          NavigatorScreen());
    
  }
}
// Classe do tipo stateful 
class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});
  
  @override
  // Variavel state que monitora os widgets da classe
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectIndex =0;
  // TextStyle tipo de variavel para receber parametros de acordo com o tipo da fonte do texto
  static const TextStyle optionStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold);
  // Cria uma lista de widgets para utilizar no navigator bar
  static const List<Widget> _widgetOptions= <Widget> [
    // Text('Index 0 : Home',style:optionStyle ),
    TelaHome(),
    TelaDiamantes(),
    TelaTigrinho(),
    CheckBox(),
    rb(),

  ];
  // Funçao que muda o index conforme o icone é pressionado
  void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Widget Scaffold 
    return Scaffold(
      appBar: AppBar(
        title: Text("App Navigator Bar"),
      ),
      // Center centraliza o widget
      body: Center(
        // .elementAt permite passar um numero como index para o widget
        child: _widgetOptions.elementAt(selectIndex),
      ),
      // criar o bottom navigator

       bottomNavigationBar: BottomNavigationBar(
        // itens é cada item do navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond_outlined),
            label: 'Diamantes',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Negócios',
            backgroundColor: Colors.orangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'CheckBox',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            label: 'Settings',
            backgroundColor: Colors.cyan,
          ),
          ],
           currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        onTap:showItemTrap ,
    ));
  }
}

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String? msg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(color: Colors.purple, width: 200, height: 100,
            child: Text("$msg",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              msg = "Pedala";
            });
          }, child: Text("Message")),
          ElevatedButton(onPressed: (){
            setState(() {
              msg = "Robinho";
            });
          }, child: Text("Message")),
        ]
      ),
    );
  }
}

class TelaDiamantes extends StatefulWidget {
  const TelaDiamantes({super.key});

  @override
  State<TelaDiamantes> createState() => _TelaDiamantesState();
}

class _TelaDiamantesState extends State<TelaDiamantes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: Colors.blue, width: 200, height: 100,
            child: Text("Diamantes para Frefa", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),)
          ]
        ),
      ),
    );
  }
}

class TelaTigrinho extends StatefulWidget {
  const TelaTigrinho({super.key});

  @override
  State<TelaTigrinho> createState() => _TelaTigrinhoState();
}

class _TelaTigrinhoState extends State<TelaTigrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.orangeAccent, width: 200, height: 100,
            child: Text("Pode colocar que estou pagando muito", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),)
        ]
      ),
    );
  }
}


class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool ischeck = false; // variavel booleana para armazenar o estado do checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: [
              Checkbox(
               value: ischeck,
               onChanged: (bool? value){
                setState(() {
                  ischeck = value!;
                });},
              ),
              Container(color: Colors.blueGrey, width: 100, height: 100,
              child: Text("$ischeck")),
        ],
      )  
    );
  }
}

class rb extends StatefulWidget {
  const rb({super.key});

  @override
  State<rb> createState() => _rbState();
}

class _rbState extends State<rb> {
  int op=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Radio Button",style: TextStyle(fontSize: 20),),
          // Widget Radio button
          RadioListTile<int>(
            title: Text("Opção 1"),
            value: 1, 
            groupValue: op,  // variavel que recebe a opçao
            onChanged: (value){
              setState(() {
                op=1;
              });
            }),
            RadioListTile<int>(
            title: Text("Opção 2"),
            value: 2, 
            groupValue: op,  // variavel que recebe a opçao
            onChanged: (value){
              setState(() {
                op=2;
              });
            }),
            RadioListTile<int>(
            title: Text("Opção 3"),
            value: 3, 
            groupValue: op,  // variavel que recebe a opçao
            onChanged: (value){
              setState(() {
                op=3;
              });
            }),
           Text("Opção escolhida: $op",style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
