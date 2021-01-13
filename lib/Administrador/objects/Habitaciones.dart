import 'dart:ffi';

class Habitaciones {
  String estadoHumedad, estadoTemperatura, numeroHabitacion;
  int humedad, temperatura;

  Habitaciones(this.humedad, this.temperatura, this.estadoHumedad,
      this.estadoTemperatura, this.numeroHabitacion);
}
