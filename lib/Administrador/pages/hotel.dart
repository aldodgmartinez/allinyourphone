import 'package:AIYP/Administrador/objects/Directorio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotel extends StatefulWidget {
  @override
  _Hotel createState() => _Hotel();
}

class _Hotel extends State<Hotel> {

  List<Directorio> listaDirectorio = [];
  
  void initState() {
    super.initState();
    DatabaseReference habitacionRef =
        FirebaseDatabase.instance.reference().child("Directorio");
    habitacionRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      listaDirectorio.clear();

      for (var individualkey in keys) {
        Directorio personas = Directorio(
          data[individualkey]['nombreCompleto'],
          data[individualkey]['cargo'],
          data[individualkey]['telefono'],
        );
        listaDirectorio.add(personas);
      }

      setState(() {
        print('lenght: $listaDirectorio.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/01/a4/b2/d2/hotel-issemym-valle-de.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            Text(
                  "Hotel ISSEMyM",
                  style: Theme.of(context).textTheme.headline5,
                ),
            SizedBox(height: 18,),
            Text(
                  "Directorio",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
            Flexible(
              child: listaDirectorio.length == 0
                  ? Text("No hay registros")
                  : ListView.builder(
                      itemCount: listaDirectorio.length,
                      itemBuilder: (_, index) {
                        return habitacionesUI(
                            listaDirectorio[index].nombreCompleto,
                            listaDirectorio[index].cargo,
                            listaDirectorio[index].telefono);
                      }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget habitacionesUI(String nombreCompleto, String cargo, String telefono) {
  return Card(
      elevation: 05.0,
      margin: EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(Icons.person),
                Text("Nombre: " + nombreCompleto,)
                ,
              ],
            ),
            SizedBox(height: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(
                  children: [Icon(Icons.work), Text(cargo.toString())],
              ),
              Row(
                  children: [
                    IconButton(icon: Icon(Icons.phone), 
                    onPressed: (){ launch('tel://$telefono'); } )
                  , Text(telefono.toString() )],
              ),
            ],)
          ],
        ),
      ),
    );
}

