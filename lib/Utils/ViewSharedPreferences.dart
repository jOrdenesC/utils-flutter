import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

//Clase para mostrar todas las preferences guardadas en el dispositivo
//Es posible copiar el valor directamente o eliminar una preferencia fácilmente
//Paquetes necesarios: shared_preferences: ^0.5.4+5

class ViewSharedPreferences extends StatefulWidget {
  @override
  _ViewSharedPreferencesState createState() => _ViewSharedPreferencesState();
}

class _ViewSharedPreferencesState extends State<ViewSharedPreferences> {
  var preferences;
  List keys = [];
  List values = [];

  @override
  void initState() {
    super.initState();
    asyncmethod();
  }

  asyncmethod() async {
    await getPrefs();
    getValues();
  }

  Future getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    var keysSharedPreferences = prefs.getKeys();
    setState(() {
      keys.add(keysSharedPreferences);
    });
    return null;
  }

  getValues() async {
    var prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < keys[0].length; i++) {
      print("dato $i");
      values.add(prefs.get(keys[0].toList()[i].toString()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Shared preferences")),
        body: ListView.builder(
            itemCount: keys[0].length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewFull(
                                "${keys[0].toList()[index].toString()}",
                                "${values.toList()[index]}")));
                  },
                  child: ListTile(
                      //leading: Text("${keys[0].toList()[index].toString()}:"),
                      title: Row(
                    children: <Widget>[
                      Text(
                        "${keys[0].toList()[index].toString()}: ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      values.toList()[index].toString().length > 20
                          ? Text(
                              "${values.toList()[index].toString().substring(0, 30)}...")
                          : Text("${values.toList()[index]}"),
                    ],
                  )),
                ),
              );
            }));
  }
}

class ViewFull extends StatefulWidget {
  final String name;
  final String value;
  ViewFull(this.name, this.value);
  @override
  _ViewFullState createState() => _ViewFullState();
}

class _ViewFullState extends State<ViewFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos de ${widget.name}")),
      body: Column(
        children: <Widget>[
          Center(
            child: Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    "${widget.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                iconSize: 40,
                icon: Icon(Icons.content_copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.value));
                  print("Valor copiado");
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(Icons.delete),
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.remove(widget.name);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
