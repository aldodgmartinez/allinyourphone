import 'package:AIYP/Administrador/objects/Habitaciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Cuartos extends StatefulWidget {
  @override
  _Cuartos createState() => _Cuartos();
}

int sensoresEncenidos = 0;

class _Cuartos extends State<Cuartos> {
  List<Habitaciones> listaHabitaciones = [];

  void initState() {
    super.initState();
    print("Edoinicial: " + sensoresEncenidos.toString());
    DatabaseReference habitacionRef =
        FirebaseDatabase.instance.reference().child("Habitaciones");
    habitacionRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      listaHabitaciones.clear();

      for (var individualkey in keys) {
        Habitaciones habitacion = Habitaciones(
          data[individualkey]['humedad'],
          data[individualkey]['temperatura'],
          data[individualkey]['estadoHumedad'],
          data[individualkey]['estadoTemperatura'],
          data[individualkey]['numeroHabitacion'],
        );
        listaHabitaciones.add(habitacion);
      }

      setState(() {
        print('lenght: $listaHabitaciones.length');
      });
    });
  }

  final TextEditingController numeroHabitacion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 18,),
            Text(
                  "Sensores de las habitaciones",
                  style: Theme.of(context).textTheme.headline5,
                ),
            SizedBox(height: 18,),
            RaisedButton(
              child: Text("Control de Sensores"),
              onPressed: (){
                 sensoresEncenidos == 0 ? activarSensores() : desactivarSensores();
              },
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: numeroHabitacion,
                decoration: InputDecoration(
                  labelText: "Busqueda por Habitación", 
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){
                      //Boton de busqueda
                      //print(numeroHabitacion.text);
                      _openDescripcion(context, numeroHabitacion.text);
                      },
                    icon: Icon(Icons.search),)),
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
              ),
            ),
            SizedBox(height: 18,),
            Flexible(
              child: listaHabitaciones.length == 0
                  ? Text("No hay habitaciones")
                  : ListView.builder(
                      itemCount: listaHabitaciones.length,
                      itemBuilder: (_, index) {
                        return habitacionesUI(
                            listaHabitaciones[index].numeroHabitacion,
                            listaHabitaciones[index].humedad,
                            listaHabitaciones[index].temperatura,
                            listaHabitaciones[index].estadoHumedad,
                            listaHabitaciones[index].estadoTemperatura);
                      }),
            ),
          ],
        ),
      ),
    );
  }


  Widget habitacionesUI(String numeroHabitacion, int humedad, int temperatura,
      String estadoHumedad, String estadoTemperatura) {

    return Card(
      elevation: 05.0,
      margin: EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Habitacion #" + numeroHabitacion,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [Icon(Icons.thermostat_outlined), Text(temperatura.toString())],
                ),
                Row(
                  children: [Icon(Icons.wb_cloudy_outlined), Text('  '+humedad.toString() )],
                ),
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[Text("Estado de la habitación",style: Theme.of(context).textTheme.subtitle1,),
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Text("Temperatura:",style: Theme.of(context).textTheme.subtitle2,),
                Text(estadoTemperatura),
                estadoTemperatura.endsWith("Correcto") ? Icon(Icons.check) : Icon(Icons.dangerous)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                   Text("      Humedad:",style: Theme.of(context).textTheme.subtitle2,),
                   Text(estadoHumedad),
                   estadoHumedad.endsWith("Correcto") ? Icon(Icons.check) : Icon(Icons.dangerous),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void activarSensores() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "activar": 1,
    };
    ref.update(data);
    sensoresEncenidos = 1;
    _openMensaje(context,"Sensores Activados");
    //print('Estado sensores: ' + sensoresEncenidos.toString());
  }

  void desactivarSensores() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "activar": 0,
    };
    ref.update(data);
    sensoresEncenidos = 0;
    _openMensaje(context,"Sensores Apagados");
    //print('Estado sensores: ' + sensoresEncenidos.toString());
  }

   _openMensaje(context,String mensaje) {
    Alert(
        context: context,
        title: mensaje,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cerrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

   _openDescripcion(context, String habitacion) {
     bool encontrado = false;
     int temperatura = 0;
     int humedad = 0;
     String edoHumedad = "";
     String edoTemp = "";
     String noHab = "";
        for(int i=0; i<listaHabitaciones.length; i++){
          if(listaHabitaciones[i].numeroHabitacion == habitacion ){
            temperatura = listaHabitaciones[i].temperatura;
            humedad = listaHabitaciones[i].humedad;
            edoHumedad = listaHabitaciones[i].estadoHumedad;
            edoTemp = listaHabitaciones[i].estadoTemperatura;
            noHab = listaHabitaciones[i].numeroHabitacion;
            encontrado=true;
          }
        }

    encontrado ? _showDescrpcion(context,temperatura,humedad,edoTemp,edoHumedad,noHab) : _openMensaje(context,"Habitacion no encontrada") ;
  }

  _showDescrpcion(context, int temperatura, int humedad, String edoTemp, String edoHumedad, String noHab){
        print(temperatura.toString() + humedad.toString() + edoTemp + edoHumedad + noHab);
        Alert(
        context: context,
        title: "Habitacion: " +noHab,
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [Icon(Icons.thermostat_outlined), Text(temperatura.toString())],
                ),
                Row(
                  children: [Icon(Icons.wb_cloudy_outlined), Text(humedad.toString() )],
                ),
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[Text("Estado de la habitación",style: Theme.of(context).textTheme.subtitle1,),
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Text("Temperatura:",style: Theme.of(context).textTheme.subtitle2,),
                Text(edoTemp),
                edoTemp.endsWith("Correcto") ? Icon(Icons.check) : Icon(Icons.dangerous)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                   Text("      Humedad:",style: Theme.of(context).textTheme.subtitle2,),
                   Text(edoHumedad),
                   edoHumedad.endsWith("Correcto") ? Icon(Icons.check) : Icon(Icons.dangerous),
              ],
            ),
            SizedBox(height: 18,)
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cerrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

}
