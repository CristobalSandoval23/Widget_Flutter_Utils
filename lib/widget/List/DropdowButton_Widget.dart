
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// DOCUMENTACIÓN DE
// https://api.flutter.dev/flutter/material/DropdownButton/DropdownButton.html

// ignore: must_be_immutable
class DropdownButtonWidget extends StatefulWidget  {
   
    String textoSeleccionado;
    List lista;

  DropdownButtonWidget ({
  this.textoSeleccionado,
  this.lista,

 });
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {

  @override
  Widget build(BuildContext context) { 
  
    return Scaffold(
       body: Column(
         children: [
           Center(
             child: DropdownButton(
                       elevation: 10,
                        hint: Text(widget.textoSeleccionado),
                        items: listaDinamica(widget.lista),
                        onChanged: (opt){
                          setState(() {
                            widget.textoSeleccionado = opt;
                          });
                        },
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 23,
                          height: 2,
                          fontStyle: FontStyle.italic,
                          ),
                        ),
           ),
         ],
       ),
      );
    }  
}

  List<DropdownMenuItem<String>> listaDinamica(lista) {
    List<DropdownMenuItem<String>> listaDrop = [];
      lista.forEach((item){
            listaDrop.add(DropdownMenuItem(
             child: Text(item),
             value: item,
             ));
         });
         return listaDrop;
}     