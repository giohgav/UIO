import 'dart:async';
import 'package:flutter/material.dart';
import 'db.dart'; // Importa la función de consulta desde db.dart
import 'package:date_format/date_format.dart';
import 'main.dart';

void main() {
  runApp(Datalogger());
}

class Datalogger extends StatelessWidget {
  

  @override
  Widget build(BuildContext pantalla) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar( backgroundColor: Colors.black, title: Text( 'Datalogger', style: TextStyle( fontSize: 28, color: Colors.white, ), ), leading: IconButton( icon: Icon(Icons.arrow_back,color: Colors.white,size: 28,), onPressed: () { Navigator.pushReplacement( pantalla, MaterialPageRoute(builder: (context) => MyApp()), ); }, ), ),
          body: SingleChildScrollView(
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: refrescaPantalla(), // Utiliza el stream de la consulta
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) { // Verifica si hay datos y no son nulos
                return DataTable(
                  columns: [
                    DataColumn(label: Text('Fecha')),
                    DataColumn(label: Text('Id Sensor')),
                    DataColumn(label: Text('Valor')),
                  ],
                  rows: snapshot.data!.map((resultado) {
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(_formatDate(resultado['fecha']))), // Formatea la fecha
                        DataCell(Text(resultado['id_sensor'])),
                        DataCell(Text(resultado['valor'].toString())),
                      ],
                    );
                  }).toList(),
                );
              }
              return CircularProgressIndicator(); // Muestra un indicador de carga mientras se cargan los datos
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar( color: Colors.black, child: Container(child: Center( child: Text( 'UIO', style: TextStyle(fontSize: 28, color: Colors.white, ), ), ), ), ),
        ),
    );
  }


  String _formatDate(String dateString) {
    var date = DateTime.parse(dateString);
    return formatDate(date, [dd, '/', mm, '/', yy, ' ', HH, ':', nn]); // Formatea la fecha usando date_format
  }
}

Stream<List<Map<String, dynamic>>> refrescaPantalla() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 5)); // Actualiza cada 5 segundos

    await ejecutarConsulta('SELECT * FROM logger'); // Realiza la consulta a la BD

    yield resultadosGlobales; // Devuelve los resultados como un stream
  }
}
