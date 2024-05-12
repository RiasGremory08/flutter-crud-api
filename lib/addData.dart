import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nimcontroller = TextEditingController();
  TextEditingController namacontroller = TextEditingController();
  TextEditingController prodicontroller = TextEditingController();

  void tambahData() {
    var url =
        Uri.parse("https://65f7c42eb4f842e80885fa76.mockapi.io/mahasiswa");
    http.post(url, body: {
      "nim": nimcontroller.text,
      "nama": namacontroller.text,
      "prodi": prodicontroller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Input data Mahasiswa',
              style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: nimcontroller,
              decoration: InputDecoration(labelText: "NIM"),
            ),
            TextFormField(
              controller: namacontroller,
              decoration: InputDecoration(labelText: "NAMA"),
            ),
            TextFormField(
              controller: prodicontroller,
              decoration: InputDecoration(labelText: "PRODI"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                tambahData();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
