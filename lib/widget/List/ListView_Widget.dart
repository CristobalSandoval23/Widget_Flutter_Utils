import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewPage extends StatefulWidget {
   List lista;
  ListViewPage({
    @required this.lista,
    });

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
