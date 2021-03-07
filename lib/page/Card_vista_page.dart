import 'package:flutter/material.dart';


class ListPrueba extends StatefulWidget {
  const ListPrueba({Key key}) : super(key: key);

  @override
  _ListPruebaState createState() => _ListPruebaState();
}

class _ListPruebaState extends State<ListPrueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        height: 220,
              child: Padding(
            padding: EdgeInsets.all(20) ,
            child: ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       child: Container(
                color: Colors.grey,
                child: Column(
                  crossAxisAlignment : CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children:<Widget>  [
                          Expanded(
                            flex: 1 ,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(70)),
                              child: Image.network('assets/1.jpg'),
                            )),
                          Expanded(
                            flex: 3 ,
                            child: Center(child: Text('Peso muerto',
                            style: TextStyle(color: Colors.white, fontSize: 20)))),
                          Expanded(
                            flex: 1 ,
                            child: IconButton(
                              focusColor: Colors.black,
                            icon: Icon(Icons.folder_shared),
                               onPressed:() {
                                 showDialog(context: context, builder: (BuildContext context) => const AlertDialog(title: Text('Material Alert!')));
                               }),
                          ),
                          ]
                        ),
                    ),                 
                         Expanded(
                             child: Padding(
                             padding: const EdgeInsets.only(left: 20, right: 20),
                             child: GridView.builder(
                              itemCount: 20,
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(                           
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1, crossAxisCount: 6, ) ,   
                          itemBuilder: (BuildContext context, int index) =>
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('-Kg'),
                                  SizedBox(height: 5,),
                                  Row(children: [
                                  Text('12'),
                                  SizedBox(width: 5,),
                                  Text('Rep'),

                                  ])
                            ],),),
            
                ),
                           ),
                         ),
                           IconButton(
                        icon: Icon(Icons.add),
                           onPressed:() {}),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}