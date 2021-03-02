
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// DOCUMENTACIÓN DE DROPDOWBUTTON 
// https://api.flutter.dev/flutter/material/DropdownButton/DropdownButton.html

class DropdowButtonPage extends StatefulWidget {
  DropdowButtonPage({Key key}) : super(key: key);

  @override
  _DropdowButtonPageState createState() => _DropdowButtonPageState();
}

class _DropdowButtonPageState extends State<DropdowButtonPage> {

  String selecciona,texto = 'hola';

  @override
  Widget build(BuildContext context) { 
  
    return Scaffold(
       body: Column(
         children: [
           Center(
             child: DropdownButton(
                       elevation: 10,
                        hint: Text(texto),
                        items: listaDinamica(),
                        onChanged: (opt){
                          setState(() {
                            texto = opt;
                            selecciona = opt;
                          });
                        },
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 23,
                          height: 2,
                          fontStyle: FontStyle.italic,
                          ),
                        // onTap: (){Navigator.popAndPushNamed(context, 'ListTile');},
                        ),
           ),
           Text(texto)
         ],
       ),
             );
           }  
           
 
}

  List<DropdownMenuItem<String>> listaDinamica() {

    List<DropdownMenuItem<String>> listaDrop = [];
    List lista = ['hola','tres','dos'];

       lista.forEach((item){
            listaDrop.add(DropdownMenuItem(
             child: Text(item),
             value: item,
             ));
         });
         return listaDrop;
}     