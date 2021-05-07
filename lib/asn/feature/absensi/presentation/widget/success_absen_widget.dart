import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class SuccessAbsesnWidget extends StatefulWidget {
  final String message;

  const SuccessAbsesnWidget(this.message);
  @override
  _SuccessAbsesnWidgetState createState() => _SuccessAbsesnWidgetState();
}

class _SuccessAbsesnWidgetState extends State<SuccessAbsesnWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.message,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )),
        SizedBox(height: 24),
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
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(12),
              color: DSColor.secondaryOrange,
              child: Text('Kembali', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
