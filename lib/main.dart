import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/writer.dart';
import 'package:youtube_flutter/screens/writer_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Writer> writers = [
    Writer.withId(1, "Yaşar", "KEMAL", "6 Ekim 1923"),
    Writer.withId(2, "Sabahattin", "ALİ", "25 Şubat 1907"),
    Writer.withId(3, "Cengiz", "AYTMATOV", "12 Aralık 1928"),
  ];

  Writer selectedWriter = Writer.withId(0, "Hiç kimse", "", "01 Ocak 1899");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yazar takip sistemi"),
        backgroundColor: Colors.blueAccent.withOpacity(0.7),
        elevation: 8,
        shadowColor: Colors.blue,
      ),
      body: buildBoy(),
    );
  }

  Widget buildBoy() {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: writers.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                margin: const EdgeInsets.only(
                    left: 10, top: 10, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      //color: buildStatusColor(writers).withOpacity(1),
                      color: Colors.amber.withOpacity(1),
                      blurStyle: BlurStyle.solid,
                      blurRadius: 7,
                      spreadRadius: 3.1,
                      offset: const Offset(7.8, 6.4),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      "${writers[index].firstName} ${writers[index].lastName}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Text(
                      "Doğum Tarihi : ${writers[index].dateOfBirth}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: const CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                  ),
                  // trailing: Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: buildStatusIcon(writers[index].dateOfBirth),
                  // ),
                  onTap: () {
                    setState(() {
                      selectedWriter = writers[index];
                    });
                    if (kDebugMode) {
                      print(
                          "${selectedWriter.firstName}  kartı üzerine basıldı");
                    }
                  },
                  onLongPress: () {
                    if (kDebugMode) {
                      print("Uzun basıldı");
                    }
                  },
                ),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                  blurStyle: BlurStyle.normal,
                  color: Colors.grey.withOpacity(0.5),
                )
              ]),
          width: double.infinity,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Seçili Yazar : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${selectedWriter.firstName} ${selectedWriter.lastName}"),
            ],
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(writers)),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent)),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("Güncelle");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: Row(
                    children: const [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Güncelle"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("Sil");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber.shade700)),
                  child: Row(
                    children: const [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sil"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Widget buildStatusIcon(int grade) {
  //   if (grade >= 50) {
  //     return const Icon(
  //       Icons.done,
  //       color: Colors.white,
  //     );
  //   } else if (grade >= 40) {
  //     return const Icon(
  //       Icons.album,
  //       color: Colors.white,
  //     );
  //   } else {
  //     return const Icon(
  //       Icons.clear,
  //       color: Colors.white,
  //     );
  //   }
  // }

  // MaterialAccentColor buildStatusColor(int dateOfBirth) {
  //   if (dateOfBirth >= 50) {
  //     return Colors.greenAccent;
  //   } else if (grade >= 40) {
  //     return Colors.blueAccent;
  //   } else {
  //     return Colors.redAccent;
  //   }
  // }
}
