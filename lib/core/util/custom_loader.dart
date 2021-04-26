import 'package:flutter/material.dart';

class LoaderDialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 210.0,
                        height: 90.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator()),
                              SizedBox(width: 32),
                              Text(
                                'Harap Menunggu',
                                style: TextStyle(color: Color(0xFF8d8d8d)),
                              )
                            ]),
                      ),
                    )
                  ]));
        });
  }
}
