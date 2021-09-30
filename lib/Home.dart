import 'package:flutter/material.dart';
import 'package:youtube_clone/CustomSearchDelegate.dart';
import 'package:youtube_clone/telas/Adicionar.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/Explorar.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricao.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _idiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) { // METODO BUILD



    List<Widget> telas = [
      Inicio(_resultado),
      Explorar(),
      Adicionar(),
      Inscricao(),
      Biblioteca(),
    ];




    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "imagens/youtube.png",
            width: 95,
            height: 33,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tv),
            onPressed: (){
              print ("acao: tv");
            },
          ),
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: (){
              print ("acao: Notificação");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res =  await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res!;
              });
              print ("Resultado: " + res!);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print ("acao: conta");
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_idiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _idiceAtual,
        onTap: (indice){
          setState(() {
            _idiceAtual = indice;
          });

        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              title: Text("Inicio"),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("Explorar"),
              icon: Icon(Icons.explore_outlined)
          ),
          BottomNavigationBarItem(
              title:  Text("Adicionar"),
              icon: Icon(Icons.add_circle_outline),
          ),
          BottomNavigationBarItem(
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions_outlined)
          ),
          BottomNavigationBarItem(
              title: Text("Biblioteca"),
              icon: Icon(Icons.video_library_outlined)
          ),
        ],
      ),
    );
  }
}
