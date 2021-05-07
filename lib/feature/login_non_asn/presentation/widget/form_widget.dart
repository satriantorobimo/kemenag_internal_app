import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/function/push_notification_service.dart';
import 'package:kemenag_go_internal_app/core/function/shared_preff.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:kemenag_go_internal_app/core/util/form_validator.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_request_data_model.dart';
import 'package:kemenag_go_internal_app/feature/login/domain/repo/login_repo.dart';
import 'package:kemenag_go_internal_app/feature/login/persentation/bloc/login_bloc/bloc.dart';

class FormNonAsnWidget extends StatefulWidget {
  @override
  _FormNonAsnWidgetState createState() => _FormNonAsnWidgetState();
}

class _FormNonAsnWidgetState extends State<FormNonAsnWidget> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _validate = false;
  bool _obscureText = true;
  bool isError = false;
  LoginRequestDataModel _loginData = LoginRequestDataModel();
  LoginBlocBloc loginBlocBloc = LoginBlocBloc(loginRepo: LoginRepository());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String errorMessage = '';

  @override
  void dispose() {
    super.dispose();
    loginBlocBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        autovalidate: _validate,
        child: BlocListener<LoginBlocBloc, LoginBlocState>(
            cubit: loginBlocBloc,
            listener: (_, LoginBlocState state) {
              if (state is LoginLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is LoginLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                SharedPreff()
                    .savedSharedString('token', state.loginModel.access_token);
                SharedPreff().savedSharedString(
                    'username', state.loginModel.user.username);
                SharedPreff().savedSharedString('user_type', 'non_asn');
                SharedPreff().savedSharedInt('id', state.loginModel.user.id);
                PushNotificationService().fcmSubscribe('nonasn');
                PushNotificationService()
                    .fcmSubscribe(state.loginModel.user.username);
                PushNotificationService().fcmUnSubscribe('guest');

                Navigator.pushNamedAndRemoveUntil(
                    context, berandaNonAsnRoute, (route) => false);
              }
              if (state is LoginError) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                setState(() {
                  _validate = true;
                  errorMessage = state.error;
                  isError = true;
                });
              }
            },
            child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
                cubit: loginBlocBloc,
                builder: (_, LoginBlocState state) {
                  if (state is LoginBlocInitial) {
                    return _getFormUI();
                  }
                  if (state is LoginLoading) {
                    return _getFormUI();
                  }
                  if (state is LoginLoaded) {
                    return _getFormUI();
                  }
                  if (state is LoginError) {
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
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          controller: _emailController,
          onChanged: (value) {
            if (_validate)
              setState(() {
                _validate = false;
              });
          },
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
          validator: FormValidator().validateEmpty,
          onSaved: (String value) {
            _loginData.email = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            controller: _pwdController,
            onChanged: (value) {
              if (_validate)
                setState(() {
                  _validate = false;
                });
            },
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
            onSaved: (String value) {
              _loginData.password = value;
            }),
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
              child: Text('Masuk', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        InkWell(
          child: Text(
            'Lupa Password?',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            Navigator.pushNamed(context, resetPasswordRoute);
          },
        ),
        SizedBox(height: 24.0),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, daftarRoute);
          },
          child: Text('Belum punya akun ? Daftar Sekarang',
              style: TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ],
    );
  }

  _loginAttempt() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      setState(() {
        isError = false;
      });
      print("Email ${_loginData.email}");
      print("Password ${_loginData.password}");
      _loginData.email = _emailController.text.toString();
      _loginData.password = _pwdController.text.toString();
      loginBlocBloc.add(LoginAttempt(_loginData));
    } else {
      ///validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
