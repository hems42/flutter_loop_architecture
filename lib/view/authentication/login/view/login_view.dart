import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/state/abstract/ife_base_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(child: Center(
        child: Container(
          child: Text("LOGIN PAGE", style: TextStyle(
            color: Colors.red,
            fontSize: dynamicHeight(0.2)
          
          ),),
        ),
      )),
    );
  }
}
