import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:kemenag_go_internal_app/core/util/form_validator.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/daftar_request_data_model.dart';
import 'package:kemenag_go_internal_app/feature/daftar/domain/repo/register_repo.dart';
import 'package:kemenag_go_internal_app/feature/daftar/persentation/bloc/register/bloc.dart';

class FormWidgetDaftar extends StatefulWidget {
  @override
  _FormWidgetDaftarState createState() => _FormWidgetDaftarState();
}

class _FormWidgetDaftarState extends State<FormWidgetDaftar> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _validate = false;
  bool _obscureText = true;
  bool isError = false;
  // bool _obscureKtpText = true;
  String errorMessage = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  RegisterBloc registerBloc =
      RegisterBloc(registerRepository: RegisterRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  DaftarRequestDataModel daftarRequestDataModel = DaftarRequestDataModel();

  @override
  void dispose() {
    registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        autovalidate: _validate,
        child: BlocListener<RegisterBloc, RegisterState>(
            cubit: registerBloc,
            listener: (_, RegisterState state) {
              if (state is RegisterLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is RegisterLoaded) {
                Navigator.pushNamedAndRemoveUntil(
                    context, daftarSuksesRoute, (route) => false);
              }
              if (state is RegisterError) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                if (state.error != 'error') {
                  setState(() {
                    _validate = true;
                    errorMessage = state.error;
                    isError = true;
                  });
                }
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
                cubit: registerBloc,
                builder: (_, RegisterState state) {
                  if (state is RegisterInitial) {
                    return _getFormUI();
                  }
                  if (state is RegisterLoading) {
                    return _getFormUI();
                  }
                  if (state is RegisterLoaded) {
                    return _getFormUI();
                  }
                  if (state is RegisterError) {
                    return _getFormUI();
                  }
                  return _getFormUI();
                })),
      ),
    );
  }

  Widget _getFormUI() {
    return Column(
      children: <Widget>[
        Visibility(
          visible: isError,
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          controller: _nameController,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            isDense: true,
            hintText: 'Nama',
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
          validator: FormValidator().validateNama,
          onSaved: (String value) {},
        ),
        SizedBox(height: 20.0),
        TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          controller: _userNameController,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            isDense: true,
            hintText: 'Username',
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
          validator: FormValidator().validateNama,
          onSaved: (String value) {},
        ),
        SizedBox(height: 20.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          controller: _emailController,
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
                    ? 'assets/images/email.png'
                    : 'assets/images/email.png',
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
          onSaved: (String value) {},
        ),
        SizedBox(height: 20.0),
        TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            controller: _pwdController,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: _validate ? DSColor.thirdDanger : Colors.black26),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.white)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(
                  _validate
                      ? 'assets/images/lock-red.png'
                      : 'assets/images/lock.png',
                  width: 8,
                  height: 8,
                ),
              ),
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
            ),
            validator: FormValidator().validatePassword,
            onSaved: (String value) {}),
        // SizedBox(height: 20.0),
        // TextFormField(
        //     autofocus: false,
        //     obscureText: _obscureKtpText,
        //     keyboardType: TextInputType.text,
        //     textAlignVertical: TextAlignVertical.center,
        //     decoration: InputDecoration(
        //       alignLabelWithHint: true,
        //       filled: true,
        //       fillColor: Colors.white,
        //       hintText: 'NIK KTP',
        //       hintStyle: TextStyle(
        //           color: _validate ? DSColor.thirdDanger : Colors.black26),
        //       focusedBorder: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(24.0),
        //           borderSide: BorderSide(color: Colors.white)),
        //       contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
        //       enabledBorder: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(24.0),
        //           borderSide: BorderSide(color: Colors.white)),
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(24.0),
        //           borderSide: BorderSide(color: Colors.white)),
        //       prefixIcon: Padding(
        //         padding: const EdgeInsets.all(14.0),
        //         child: Image.asset(
        //           _validate ? 'assets/images/ktp.png' : 'assets/images/ktp.png',
        //           width: 8,
        //           height: 8,
        //         ),
        //       ),
        //       suffixIcon: GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             _obscureKtpText = !_obscureKtpText;
        //           });
        //         },
        //         child: Icon(
        //           _obscureKtpText
        //               ? Icons.visibility_outlined
        //               : Icons.visibility_off_outlined,
        //           semanticLabel:
        //               _obscureKtpText ? 'show password' : 'hide password',
        //         ),
        //       ),
        //     ),
        //     validator: FormValidator().validateKtp,
        //     onSaved: (String value) {
        //       _daftarRequestDataModel.password = value;
        //     }),
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
              onPressed: _registerAttempt,
              padding: EdgeInsets.all(12),
              color: DSColor.secondaryOrange,
              child: Text('Daftar', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        InkWell(
          child: Text(
            'Sudah punya akun ? Masuk',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  _registerAttempt() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      daftarRequestDataModel.email = _emailController.text.toString();
      daftarRequestDataModel.nama = _nameController.text.toString();
      daftarRequestDataModel.password = _pwdController.text.toString();
      daftarRequestDataModel.username = _userNameController.text.toString();
      registerBloc.add(AttempRegister(daftarRequestDataModel));
    } else {
      ///validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
