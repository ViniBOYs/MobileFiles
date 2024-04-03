import 'package:ecommerce_app1/admin.dart';
import 'package:flutter/material.dart';

class clietHomePage extends StatefulWidget {
  const clietHomePage({super.key});

  @override
  State<clietHomePage> createState() => _clietHomePageState();
}

class ItensToBuyComponent extends StatefulWidget {
  const ItensToBuyComponent({super.key});

  @override
  State<ItensToBuyComponent> createState() => _ItensToBuyComponentState();
}

class _ItensToBuyComponentState extends State<ItensToBuyComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(height: 100,color: Colors.amber,),
            componentItem("test2", "teste", 100)
          ],
        )
      ],
    );
  }
}








class _clietHomePageState extends State<clietHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Do Cliente"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          // Container(height: 100,color: Colors.amber,)
          ItensToBuyComponent(),
        ],
      ),
    );
  }
}