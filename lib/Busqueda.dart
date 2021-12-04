import 'package:flutter/material.dart';

class Busqueda extends StatefulWidget
{
  @override
  BusquedaApp createState() =>BusquedaApp();
}

class BusquedaApp extends State <Busqueda>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
        title: "Negocios de mi barrio",
    home: Scaffold
    (
    appBar: AppBar
    (
        title: Text("Busqueda"),

    actions: [
    RaisedButton
    (
    onPressed: ()
    {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Busqueda()));
    },

        disabledColor: Colors.amber,
  child: Image.asset('image/btnCarrito.png')
  ),
  ]
    ),
    ),
    );
  }
}