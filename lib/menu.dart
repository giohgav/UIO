/* import 'package:flutter/material.dart';
import 'datalogger.dart';

void main() {
  runApp(Menu()); // cambiar titulo
}

class Menu extends StatelessWidget { // cambiar titulo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( backgroundColor: Colors.black, title: Text( 'Menu', style: TextStyle( fontSize: 28 ,color: Colors.white, ), ), ),
        body: Center(),
        bottomNavigationBar: BottomAppBar( color: Colors.black, child: Container( child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[ IconButton( icon: Icon(Icons.notifications, color: Colors.white), onPressed: () { }, ), IconButton( icon: Icon(Icons.assignment, color: Colors.white), onPressed: () {runApp(Datalogger()); }, ), IconButton( icon: Icon(Icons.settings, color: Colors.white), onPressed: () { }, ), ], ), ), ),

     ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'datalogger.dart';
import 'alertas.dart';
import 'random.dart';

void main() {
  mainRandom();
  runApp(Menu()); // cambiar titulo
}

class Menu extends StatelessWidget { // cambiar titulo
  @override
  Widget build(BuildContext pantalla) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( backgroundColor: Colors.black, title: Text( 'Menu', style: TextStyle( fontSize: 28 ,color: Colors.white, ), ), ),
        body: Center(),
        bottomNavigationBar: BottomAppBar( color: Colors.black, child: Container( child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[ IconButton( icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {Navigator.push(pantalla, MaterialPageRoute(builder: (context) => Alertas())); }, ), IconButton( icon: Icon(Icons.assignment, color: Colors.white), onPressed: () {Navigator.push(pantalla, MaterialPageRoute(builder: (context) => Datalogger()));}, ), IconButton( icon: Icon(Icons.settings, color: Colors.white), onPressed: () { }, ), ], ), ), ),

     ),
     
    );
  }
}
