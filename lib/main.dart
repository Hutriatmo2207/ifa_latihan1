import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan 1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan 1"),
              backgroundColor: Colors.deepOrange,
            ),
            body: Column(
              children: [
                Text("Universitas Teknokrat Indonesia"),
                Text ("Bandar Lampung"),
                Container(
                  height: 30,
                  width: 500,
                  color: Color.fromARGB(255, 231, 93, 80),
                ),
                Row(
                  children: [
                    Text("Data 1 "),
                    Text("Data 2 "),
                    Text("Data 3 "),
                    Text("Data 4 "),
                    Text("Data 5 "),
                  ],
                )
              ],
            ),
          ),
        );
  }
}