import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/form_validator.dart';

import 'package:kemenag_go_internal_app/feature/reset_password/data/model/reset_password_request_model.dart';

class FormWidgetResetPassword extends StatefulWidget {
  @override
  _FormWidgetResetPasswordState createState() =>
      _FormWidgetResetPasswordState();
}

class _FormWidgetResetPasswordState extends State<FormWidgetResetPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _validate = false;
  ResetPasswordRequestDataModel requestDataModel =
      ResetPasswordRequestDataModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        autovalidate: _validate,
        child: _getFormUI(),
      ),
    );
  }

  Widget _getFormUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            isDense: true,
            hintText: 'Email',
            hintStyle: TextStyle(
                color: _validate ? DSColor.thirdDanger : Colors.black26),
            contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                _validate
                    ? 'assets/images/user-red.png'
                    : 'assets/images/user.png',
                width: 8,
                height: 8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.white)),
          ),
          validator: FormValidator().validateEmail,
          onSaved: (String value) {
            requestDataModel.email = value;
          },
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            width: double.infinity,
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: _loginAttempt,
              padding: EdgeInsets.all(12),
              color: DSColor.secondaryOrange,
              child: Text('Setel Ulang', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        InkWell(
          child: Text(
            'Kembali Ke Login',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            Navigator.pushNamed(context, resetPasswordRoute);
          },
        ),
      ],
    );
  }

  _loginAttempt() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      print("Email ${requestDataModel.email}");
    } else {
      ///validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
