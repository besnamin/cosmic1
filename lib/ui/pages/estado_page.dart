import 'package:flutter/material.dart';

class EstadoPage extends StatefulWidget {
  const EstadoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EstadoPage> createState() => _EstadoPageState();
}

class _EstadoPageState extends State<EstadoPage> {
  // Listado de cadenas
  var listado = [
    Persona("10001", "Diego Andres Sierra", "Relajado",
        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/sloth_lazybones_sluggard_avatar-128.png"),
    Persona(
        "10002",
        "Natali Florez",
        "Trabajando",
        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/builder_worker_helmet-128.png"),
    Persona("10003", "Gabriel Gonzalez", "Dia de futbol",
        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_person_kid_child-128.png"),
    Persona("10004", "Juan Martinez", "Estudiando en la u",
        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/indian_man_male_person-128.png"),
    Persona("10005", "Victor Gonzalez", "Aburrido",
        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/female_woman_avatar_portrait_1-128.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          'Cosmic Beauty',
        ),
      ),
      body: ListView.builder(
        itemCount: listado.length,
        itemBuilder: (context, i) {
          return Card(
            child: Row(
              children: [
                Image.network(listado[i].img),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Nombre: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(listado[i].name),
                            
                          ],
                        ),
                        const Text(
                          "Estado:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(listado[i].desc),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Persona {
  late String id;
  late String name;
  late String desc;
  late String img;

  Persona(this.id, this.name, this.desc, this.img);
}