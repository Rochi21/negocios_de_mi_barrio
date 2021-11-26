import 'package:flutter/material.dart';
import 'Busqueda.dart';

void main() {
  runApp(Barrio());
}

class Barrio extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InicioArranque());
  }
}

class InicioArranque extends StatefulWidget
{
  @override
  Inicio createState() => Inicio();
}

class Inicio extends State<InicioArranque>
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
          title: Text("Negocios"),
        ),

        body: SingleChildScrollView
        (
          child: Row
          (
            children: <Widget>
            [
              Padding
              (
                padding:EdgeInsets.only(left:20, top: 20, right: 10, bottom: 0),

                child: ElevatedButton
                (
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Busqueda()));
                  },

                  child: Image.asset('image/btnBuscar.png')
                ),
              ),

              Padding
              (
                padding: EdgeInsets.only(left:0, top: 20, right: 20, bottom: 0),

                child: TextField
                (
                  decoration: InputDecoration
                  (
                    border:OutlineInputBorder(),
                    labelText: "Busqueda",
                    hintText: "Buscar productos, marcas y más..."
                  ),
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}
