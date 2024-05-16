import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
void main() async {
  runApp(MaterialApp(home:Home()));

  //getdatabase pega o caminho do banco de dados 
  final database = openDatabase(join(await getDatabasesPath(),'products.db'),
  onCreate: (db,version){
    db.execute('CREATE TABLE products(id INTERGER PRIMARY KEY, no me TEXT, preco INTERGER)');
  },version: 1);



  Future <List<Product>> products() async {
    final db = await database;
    final List<Map<String, Object?>> productMaps = await db.query('products');

    return [
      for (final{

        'id': id as int, 
        'nome': nome as String, 
        "preco": preco as int, 

      }in productMaps)
      Product (id: id, nome: nome, preco: preco),
    ];
  }

  //Função para alterar dados já salvos no banco de dados
  Future<void> updateProduct(product product)async{
    final db = await database;
    await db.update('products', product.toMap(), where: 'id = ?', whereArgs: [product.id]);
  }

// insere dados
  Future<void> insertproduct(product product)async {
    final db = await database; //armazena em db o banco de dados.

    //caso o erro tenta sobre escrever utilize conflict algorithm;
    db.insert('products',product.toMap(),conflictAlgorithm: ConflictAlgorithm.replace); //salva a informacao 
  }


var Sabao  = product(
id:1,
nome: 'Sabão de Coco',
preco:2, 
);
var tadala = product(
  id: 2, 
  nome : 'Tadala',
  preco: 1,
);
  insertproduct(Rocky);
  print(await products());
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('APP BD')),
      body: Column(children: [
        Text("App Banco de Dados!")
      ],)
    );
  }
}


class Dog {
  final int id;
  final String nome;
  final int idade;
  Dog({required this.id,required this.nome,required this.idade});

  Map <String,Object?> toMap() {
    return {
      'id': id,
      'idade': idade,
      'nome': nome
    };
  }


@override

String toString() {
  return 'Dog{id $id, nome $nome, idade: $idade}';

}
}
