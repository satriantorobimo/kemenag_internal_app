import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/edit_password/presentation/widget/edit_password_form_widget.dart';

class EditPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: EditPasswordFormWidget(),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text('Edit Password',
          style: TextStyle(color: Colors.black, fontSize: 16)),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
