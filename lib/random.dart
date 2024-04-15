import 'dart:async';
import 'dart:math';
import 'db.dart';

void mainRandom() {
  Timer.periodic(Duration(seconds: 30), (Timer t) {
    // Genera un valor aleatorio
    double valorAleatorio = double.parse(((Random().nextDouble() * (200 - 100) + 100).toStringAsFixed(1))); // Entre 100 y 200

    // Obtiene la fecha actual
    DateTime fechaActual = DateTime.now();

    // Define los valores fijos de id_sensor, max y min
    String idSensor = '0001'; // Id sensor fijo, puedes modificarlo si es necesario
    double max = 190.0; // Valor máximo fijo
    double min = 170.0; // Valor mínimo fijo

    // Llama a la función para ejecutar la consulta en db.dart
    ejecutarConsulta('INSERT INTO logger (id_sensor, fecha, max, min, valor) VALUES ' +
        '("$idSensor", "${fechaActual.toIso8601String()}", $max, $min, $valorAleatorio)');
  });
}
