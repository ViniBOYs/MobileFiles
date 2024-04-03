import 'package:flutter/material.dart';

class clietHomePage extends StatefulWidget {
  const clietHomePage({super.key});

  @override
  State<clietHomePage> createState() => _clietHomePageState();
}

class _clietHomePageState extends State<clietHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Do Cliente"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(width: 100,height: 100,color: Colors.amber,)
        ],
      ),
    );
  }
}