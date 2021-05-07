import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';

class EditPasswordFormWidget extends StatefulWidget {
  @override
  _EditPasswordFormWidgetState createState() => _EditPasswordFormWidgetState();
}

class _EditPasswordFormWidgetState extends State<EditPasswordFormWidget> {
  TextEditingController _pwdLamaController = TextEditingController();
  TextEditingController _pwdBaruController = TextEditingController();
  TextEditingController _pwdBaruConfirmController = TextEditingController();
  bool _obscureText = true, _obscureTextPwdBaru = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextFormField(
              autofocus: false,
              controller: _pwdLamaController,
              cursorColor: DSColor.primaryGreen,
              obscureText: _obscureText,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      semanticLabel:
                          _obscureText ? 'show password' : 'hide password',
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Password Lama'),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextFormField(
              autofocus: false,
              controller: _pwdBaruController,
              cursorColor: DSColor.primaryGreen,
              obscureText: _obscureTextPwdBaru,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureTextPwdBaru = !_obscureTextPwdBaru;
                      });
                    },
                    child: Icon(
                      _obscureTextPwdBaru
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      semanticLabel: _obscureTextPwdBaru
                          ? 'show password'
                          : 'hide password',
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Password Baru'),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextFormField(
              autofocus: false,
              obscureText: _obscureTextPwdBaru,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              controller: _pwdBaruConfirmController,
              cursorColor: DSColor.primaryGreen,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureTextPwdBaru = !_obscureTextPwdBaru;
                      });
                    },
                    child: Icon(
                      _obscureTextPwdBaru
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      semanticLabel: _obscureTextPwdBaru
                          ? 'show password'
                          : 'hide password',
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Konfirmasi Password Baru'),
            ),
          ),
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
                onPressed: () {},
                padding: EdgeInsets.all(12),
                color: DSColor.primaryGreen,
                child: Text('Simpan Perubahan',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
