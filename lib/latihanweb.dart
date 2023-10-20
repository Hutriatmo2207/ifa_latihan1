import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormInput(),
    );
  }
}

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  
  String? _jk;
  void Pilihjk(String value) {
    setState(() {
      _jk = value;
    });
  }
  
  List<String> agama = [
    "islam",
    "kristen katolik",
    "kristen protestan",
    "hindu",
    "budha",
    "lainya",
  ];

  String _agama = "islam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Form Input"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: "Alamat",
                labelText: "Alamat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: "Laki-laki",
              title: Text("Laki-laki"),
              groupValue: _jk,
              onChanged: (String? value) {
                Pilihjk(value!);
              },
              activeColor: Colors.amber,
              subtitle: Text("Pilih Ini Jika Laki-laki"),
            ),
            RadioListTile(
              value: "Perempuan",
              title: Text("Perempuan"),
              groupValue: _jk,
              onChanged: (String? value) {
                Pilihjk(value!);
              },
              activeColor: Colors.amber,
              subtitle: Text("Pilih Ini Jika Perempuan"),
            ),            
          ],
        ),
      ),
    );
  }
}
