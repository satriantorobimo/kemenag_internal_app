import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/daftar/persentation/widget/form_widget_daftar.dart';
import 'package:kemenag_go_internal_app/feature/daftar/persentation/widget/form_widget_daftar_asn.dart';
import 'package:kemenag_go_internal_app/feature/daftar/persentation/widget/header_widget_daftar.dart';
import 'package:kemenag_go_internal_app/feature/daftar/persentation/widget/header_widget_daftar_asn.dart';

class DaftarScreen extends StatefulWidget {
  @override
  _DaftarScreenState createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  bool isAsn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isAsn ? HeaderWidgetDaftarAsn() : HeaderWidgetDaftar(),
            SizedBox(height: 4),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(
                              color: isAsn
                                  ? DSColor.secondaryOrange
                                  : Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            isAsn = true;
                          });
                        },
                        padding: EdgeInsets.all(12),
                        color: !isAsn
                            ? DSColor.primaryGreen
                            : DSColor.secondaryOrange,
                        child:
                            Text('ASN', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(
                                color: !isAsn
                                    ? DSColor.secondaryOrange
                                    : Colors.white)),
                        onPressed: () {
                          setState(() {
                            isAsn = false;
                          });
                        },
                        padding: EdgeInsets.all(12),
                        color: isAsn
                            ? DSColor.primaryGreen
                            : DSColor.secondaryOrange,
                        child: Text('NON ASN',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 4),
            isAsn ? FormWidgetDaftarAsn() : FormWidgetDaftar()
          ],
        ),
      ),
    );
  }
}
