import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/login_non_asn/presentation/widget/form_widget.dart';
import 'package:kemenag_go_internal_app/feature/login_non_asn/presentation/widget/header_widget.dart';

class LoginNonAsnScreen extends StatefulWidget {
  @override
  _LoginNonAsnScreenState createState() => _LoginNonAsnScreenState();
}

class _LoginNonAsnScreenState extends State<LoginNonAsnScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            HeaderNonAsnWidget(),
            SizedBox(height: 50),
            FormNonAsnWidget()
          ],
        ),
      ),
    );
  }
}
