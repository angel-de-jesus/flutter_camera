import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Page1 extends StatefulWidget{
  @override 
  _ListaUsuario createState() => _ListaUsuario();
}

class _ListaUsuario extends State<Page1>{
  List<String> usuarios=[];

  @override
  void initState(){
    super.initState();
    getRequest();
  }
  
  @override 
  Widget build(BuildContext context){
    return  Container(
      child: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: new Text('${index}.- ${usuarios[index]}'),
            ),
          );
        },
      ),
      
    );
  }

  Future getRequest() async {
    var url = Uri.parse('https://randomuser.me/api/?results=100');
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = convert.jsonDecode(response.body);
      
    for(var user in decodedData['results']){
      String nombreCompleto= user['name']['title']+' ';
      nombreCompleto+=user['name']['first']+' ';
      nombreCompleto+=user['name']['last'];
      setState(() {
        usuarios.add(nombreCompleto);
      });
    }
  }
}