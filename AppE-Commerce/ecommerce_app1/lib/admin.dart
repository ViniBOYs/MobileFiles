import 'package:flutter/material.dart';



class componentItem extends StatefulWidget {
  final String nome_item;
  final String img;
  final double valor;
  const componentItem(this.nome_item,this.img,this.valor,{super.key});

  @override
  State<componentItem> createState() => _componentItemState();
}

class _componentItemState extends State<componentItem> {
  //colocar as func
  int quantidade = 0;


  void _add_qtd(){
    setState(() {
      quantidade++;
    });
  }

  void _sub_qtd(){
    setState(() {
      if (quantidade != 0){
      quantidade--;
      }
    });
  }

  void _reset_qtd(){
    setState(() {
      quantidade=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          
          children: [
            Container(width: double.maxFinite,height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 196,height: double.maxFinite,child: Image.asset('${widget.img}')),
                Container(width: 196,height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${widget.nome_item}',style: TextStyle(fontSize: 25,color: Colors.black),),
                    Text('Preço: R\$ ${widget.valor}',style: TextStyle(fontSize: 15,color: Colors.black),),
                    Text('Quantidade: ${quantidade}',style: TextStyle(fontSize: 15,color: Colors.black),),
                    Container(width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){
                          _add_qtd();
                        }, 
                        child: Icon(Icons.plus_one),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),),
                        ElevatedButton(onPressed: (){
                          _sub_qtd();
                        }, 
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent,
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        )),
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      _reset_qtd();
                    }, 
                    child: Icon(Icons.highlight_remove),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      elevation: 3,
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),),    
                  ],
                  )
                ),
              ]
            )),
          ],
        )
      ]
    );
  }
}





class adminHomePage extends StatelessWidget {
  const adminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Adm"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          componentItem("Redmi Note 12", 'img/redmiNote12.webp', 1204.40),
          componentItem("Pc Semi Novo", 'img/pcZeroBala.jpg', 35200.32)
        ],
      ),
    );  
  }
}