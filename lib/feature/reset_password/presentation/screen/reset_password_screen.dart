import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/reset_password/presentation/widget/form_widget.dart';
import 'package:kemenag_go_internal_app/feature/reset_password/presentation/widget/header_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
            HeaderWidgetResetPassword(),
            SizedBox(height: 50),
            FormWidgetResetPassword()
          ],
        ),
      ),
    );
  }
}
