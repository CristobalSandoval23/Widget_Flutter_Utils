import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTilePage extends StatefulWidget {
   List lista;
  ListTilePage({
    @required this.lista,
    });

  @override
  _ListTilePageState createState() => _ListTilePageState();
}

class _ListTilePageState extends State<ListTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         physics: BouncingScrollPhysics() ,
         itemCount: widget.lista.length,
         padding: EdgeInsets.all(8),
         itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.blue,
            child: ListTile(
                      title: Text(widget.lista[index].toString()),
                       focusColor: Colors.blue,
            ),
          );
        }      
    );
  }
}
