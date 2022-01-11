import 'package:flutter/material.dart';
import 'package:flutter_sqflite/db/db_helper.dart';
import 'package:flutter_sqflite/model/pegawai.dart';

class FormPegawai extends StatefulWidget {
  final Pegawai? pegawai;

  FormPegawai({this.pegawai});

  @override
  _FormPegawaiState createState() => _FormPegawaiState();
}

class _FormPegawaiState extends State<FormPegawai> {
  DbHelper db = DbHelper();

  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? mobileNo;
  TextEditingController? email;

  @override
  void initState() {
    firstName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.firstName);
    lastName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.lastName);
    mobileNo = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.mobileNo);
    email = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pegawai'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: firstName,
            decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: lastName,
            decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: mobileNo,
            decoration: InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          RaisedButton(
            color: Colors.red,
            child: (widget.pegawai == null)
                ? Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
            onPressed: () {
              upsertPegawai();
            },
          )
        ],
      ),
    );
  }

  Future<void> upsertPegawai() async {
    if (widget.pegawai != null) {
      //insert
      await db.updatePegawai(Pegawai.fromMap({
        'id': widget.pegawai!.id,
        'firstName': firstName!.text,
        'lastName': lastName!.text,
        'mobileNo': mobileNo!.text,
        'email': email!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.savePegawai(Pegawai(
        firstName: firstName!.text,
        lastName: lastName!.text,
        mobileNo: mobileNo!.text,
        email: email!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
