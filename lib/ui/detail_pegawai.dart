import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/pegawai.dart';

class DetailPage extends StatelessWidget {
  final Pegawai? pegawai;

  DetailPage(this.pegawai);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('First Name: ${pegawai!.firstName}'),
            Text('Last Name: ${pegawai!.lastName}'),
            Text('Mobile No: ${pegawai!.mobileNo}'),
            Text('Email: ${pegawai!.email}'),
          ],
        ),
      ),
    );
  }
}
