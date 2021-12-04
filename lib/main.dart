import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Busqueda.dart';
import 'Tienda.dart';

void main() {
  Firebase.initializeApp();
  //WidgetsFlutterBinding.ensureInitialized();
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
          title: Text("Negocios de mi barrio"),

          actions: [
            RaisedButton
              (
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Busqueda()));
                },

                //disabledColor: Colors.amber,
                child: Image.asset('image/btnCarrito.png')
            ),
          ]
        ),

        body: SingleChildScrollView
        (
          child: Center(
            child: StreamBuilder(
              stream:
              FirebaseFirestore.instance.collection("Tiendas").snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                    /*1*/
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        /*2*/
                                        Container(
                                          padding:
                                          const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                .get("Nombre"),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]
                                              .get("Descripcion"),
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*3*/
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.asset("image/"+snapshot.data!.docs[index]
                                        .get("rutaLogo"),),
                                  ),
                                  /*ElevatedButton(
                                      onPressed: () {
                                        String idDoc=snapshot.data!.docs[index].id;
                                        buscarDoc(idDoc);
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ShopOne(objTienda)));
                                      }, child: Text("Entrar"))*/
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Negocios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Cuenta',
            ),
          ],

          //currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          //onTap: ,
        ),
      ),
    );//
  }
}
