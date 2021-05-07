import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          'Pendaftaran Berhasil',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 16),
        Center(
            child: Text(
          'Mohon cek email anda untuk melakukan aktivasi akun anda',
          style: TextStyle(color: Colors.white, fontSize: 12),
        )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            width: double.infinity,
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: () {
                Navigator.pushNamed(context, berandaRoute);
              },
              padding: EdgeInsets.all(12),
              color: DSColor.secondaryOrange,
              child: Text('Masuk', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
