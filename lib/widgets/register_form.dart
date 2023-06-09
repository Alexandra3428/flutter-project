import 'package:flutter/material.dart';
import 'package:flutter_crud/api/authentication_api.dart';
import 'package:flutter_crud/utils/dialogs.dart';
import 'package:flutter_crud/utils/responsive.dart';
import 'package:flutter_crud/widgets/input_text.dart';
import 'package:flutter_crud/widgets/icon_container.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '', _password_confirmation = '';
  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    print("form isOk ${isOk}");
    if (isOk) {
      ProgressDialog.show(context);
      await _authenticationAPI.register(
        email: _email,
        password: _password,
        password_confirmation: _password_confirmation,
      );
      ProgressDialog.dissmiss(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Email",
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text!.contains("@")) {
                    return "Invalid email";
                  }
                  return "Email is required";
                },
                key: Key('email'),
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Password",
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().length < 6) {
                    return "Invalid password";
                  }
                  return "Password is required";
                },
                key: Key('password'),
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Password confirmation",
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 17, 17),
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (text) {
                  _password_confirmation = text;
                },
                validator: (text) {
                  if (text!.trim().length < 6) {
                    return "Confirm password";
                  }
                  return "Password is required confirmation";
                },
                key: Key('password_confirmation'),
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: this._submit,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(height: responsive.dp(10)),
            ],
          ),
        ),
      ),
    );
  }
}
