import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //importa o pacote http para o app
import 'dart:convert'; //metodo para converter dado json


enum MoneyTypeInLabel {
  blue('USD', Colors.blue),
  pink('RUB', Colors.pink),
  green('BRL', Colors.green);

  const MoneyTypeInLabel(this.label, this.color);
  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values for the second dropdown menu.
enum MoneyTypeOutLabel {
  smile('USD', Colors.blue),
  cloud('RUB', Colors.pink),
  brush('BRL', Colors.green);

  const MoneyTypeOutLabel(this.label, this.icon);
  final String label;
  final Color icon;
}




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valueIn = TextEditingController();
  TextEditingController finalValue = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  MoneyTypeInLabel? selectedColor;
  MoneyTypeOutLabel? selectedIcon;
  String ? _precoBitcoin; //variavel para armazenar o valor do bitcoin
  
  // async é porque a função vai esperar uma resposta da api pelo metodo http.get
  _consultaPrecoBitcoin() async{
    String url = "https://blockchain.info/ticker"; // url da api
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body); // decodifica a infromação vinda da api
    print("Codigo de status da esposta da api ${response.statusCode.toString()}");
    setState(() {
      _precoBitcoin =dados["BRL"]["buy"].toString();
    });
    print(_precoBitcoin);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
      ),
      body: Center(
        child: Column(
          children: [        
            Container(width: 200, height: 100,child: Image.asset("images/bitcoinImage.webp"),),
            Text("Valor do BitCoin R\$ ${_precoBitcoin}", style: TextStyle(fontSize: 25),),
            ElevatedButton(onPressed: _consultaPrecoBitcoin, child: Text("Verificar")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(width: 150,child: 
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: valueIn,
                        decoration: InputDecoration(hintText: 'Valor a Converter'),
                      ),
                    ),Container(height: 10),
                    DropdownMenu<MoneyTypeInLabel>(
                      // initialSelection: MoneyTypeInLabel.green,
                      controller: colorController,
                      requestFocusOnTap: false,
                      label: Icon(Icons.attach_money),
                      onSelected: (MoneyTypeInLabel? color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      dropdownMenuEntries: MoneyTypeInLabel.values
                          .map<DropdownMenuEntry<MoneyTypeInLabel>>(
                              (MoneyTypeInLabel color) {
                        return DropdownMenuEntry<MoneyTypeInLabel>(
                          value: color,
                          label: color.label,
                          enabled: color.label != 'Grey',
                          style: MenuItemButton.styleFrom(
                            foregroundColor: color.color,
                          ),
                        );
              }).toList(),),
                    Text("${selectedColor?.label}"),
                  ],
                ),
                Column(
                  children: [
                    Container(width: 150,child: 
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: finalValue,
                        decoration: InputDecoration(hintText: 'Valor Convertido'),
                      ),
                    ),Container(height: 10),
                    DropdownMenu<MoneyTypeOutLabel>(
                      // initialSelection: MoneyTypeOutLabel.smile,
                      controller: iconController,
                      requestFocusOnTap: false,
                      label: Icon(Icons.money_sharp),
                      onSelected: (MoneyTypeOutLabel? icon) {
                        setState(() {
                          selectedIcon = icon;
                        });
                      },
                      dropdownMenuEntries: MoneyTypeOutLabel.values
                          .map<DropdownMenuEntry<MoneyTypeOutLabel>>(
                              (MoneyTypeOutLabel icon) {
                        return DropdownMenuEntry<MoneyTypeOutLabel>(
                          value: icon,
                          label: icon.label,
                        );
                      }).toList(),),
                    Text("${selectedIcon?.label}")
                  ],
                )
              ],
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                double input = double.tryParse(valueIn.text) ?? 0;
                if (selectedColor?.label == 'BRL' && selectedIcon?.label == 'USD') {
                  finalValue = input * 5;
                }
              });
            }, child: Text("teste"))
            
            
            






            // DropdownMenu<MoneyTypeOutLabel>(
            //           controller: iconController,
            //           enableFilter: true,
            //           requestFocusOnTap: true,
            //           leadingIcon: const Icon(Icons.search),
            //           label: const Text('Icon'),
            //           inputDecorationTheme: const InputDecorationTheme(
            //             filled: true,
            //             contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            //           ),
            //           onSelected: (MoneyTypeOutLabel? icon) {
            //             setState(() {
            //               selectedIcon = icon;
            //             });
            //           },
            //           dropdownMenuEntries:
            //               MoneyTypeOutLabel.values.map<DropdownMenuEntry<MoneyTypeOutLabel>>(
            //             (MoneyTypeOutLabel icon) {
            //               return DropdownMenuEntry<MoneyTypeOutLabel>(
            //                 value: icon,
            //                 label: icon.label,
            //                 leadingIcon: Icon(icon.icon),
            //               );
            //             },
            //           ).toList(),)

          ],
        ),
      ),
    );  
  }
}




