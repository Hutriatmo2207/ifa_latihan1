import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const FormInput({Key? key}) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController var_tanggal = TextEditingController();

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

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    var_tanggal.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return DateFormat('dd MM yyyy').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            hintColor: Colors.teal,
            colorScheme: ColorScheme.light(primary: Colors.teal),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var_tanggal.text = formatDate(selectedDate);
      });
    }
  }

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
                ),
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
                ),
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
                ),
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
            DropdownButton<String>(
              value: _agama,
              items: agama.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _agama = newValue!;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: var_tanggal,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Tanggal",
                labelText: "Tanggal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                      Icons.calendar_today), // Perbaikan: Icon.calendar_today
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
