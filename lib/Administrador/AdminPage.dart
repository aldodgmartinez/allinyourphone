import 'package:AIYP/Administrador/pages/cerrarSesion.dart';
import 'package:AIYP/Administrador/pages/hotel.dart';
import 'package:AIYP/Administrador/pages/restaurante.dart';
import 'package:AIYP/Administrador/pages/cuartos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  int _selectedIndex = 0;
  final tabs = [
    Restaurante(),
    Cuartos(),
    Hotel(),
    CerrarSesion(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel ISSEMyM - Valle de Bravo"),
      ),
      body: Center(child: tabs[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurante',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hotel),
            label: 'Cuartos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Hotel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Salir',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
