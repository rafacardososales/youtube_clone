import 'package:flutter/material.dart';



class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return Container();

    //Codigo de sugestões na parte de pesquisas. Pode ulilizar uma APi para isso.
    //Neste caso foi usada apenas uma lista para exemplo.
    /*
    List<String> lista = List<String>.filled(500,"0",growable: true);
    if(query.isNotEmpty){
      lista= [
        "Froro", "Quapa", "Dynoro", "Si Us Plau", "Kiki", "Ricii"
      ].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    }else {
      return Center(
        child: Text("Nenhum resultado encontrado"),
      );
    }*/

  }
  

  
}