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
    //Text('Index 0 : Home',style:optionStyle ),
    TelaHome(),
    TelaBraza(),
    TelaChingLing(),
    TelaFranca(),
    TelaMexico(),

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
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beach_access),
            label: 'Braza',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_friendly_sharp),
            label: 'Ching Ling',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cell_tower),
            label: 'França',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hail),
            label: 'Merrico',
            backgroundColor: Colors.orangeAccent,
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
  String? msg; // declara variavel msg do tipo string
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent, width: 400, height: 623,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant_menu, size: 200,),
                Text("MENU", style: TextStyle(fontSize: 35),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TelaBraza extends StatelessWidget {
  const TelaBraza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Center(
            child: Image.network('https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png', 
            width: 200,height: 100,
          )),
          Container(width: 100,height: 30,),
          Container(color: Colors.green, width: 200, height: 60,
          child: Text("Comida BRASILEIRA", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(180, 0, 0, 0)), textAlign: TextAlign.center,),),
          Container(width: 100,height: 30,),
          Container(color: Colors.green, width: 300, height: 370,
          child: Column(
            children: [
              Text("Feijoada",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),//Title
              Text("Aestsdfsfajdahdjabdja",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,), //Body
              Container(height: 10,),
              Image.network('https://img.nsctotal.com.br/wp-content/uploads/2022/06/feijoada-944x531.jpg', width: 280)              
            ],)
          ),
         ]
      ),
    );
  }
}

class TelaChingLing extends StatelessWidget {
  const TelaChingLing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(color: Colors.red, width: 250, height: 100,
          child: Image.network('https://www.infoescola.com/wp-content/uploads/2017/04/pombo-comum_349117397.jpg', width: 100, height: 80,),)
        ]
      ),
    );
  }
}

class TelaFranca extends StatelessWidget {
  const TelaFranca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(color: Colors.blue, width: 250, height: 100,
          child: Image.network('https://www.infoescola.com/wp-content/uploads/2017/04/pombo-comum_349117397.jpg', width: 100, height: 80,),)
        ]
      ),
    );
  }
}

class TelaMexico extends StatelessWidget {
  const TelaMexico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(color: Colors.orangeAccent, width: 250, height: 100,
          child: Image.network('https://www.infoescola.com/wp-content/uploads/2017/04/pombo-comum_349117397.jpg', width: 100, height: 80,),)
        ]
      ),
    );
  }
}