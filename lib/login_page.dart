import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  bool  validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // print('Form is valid. Email: $_email, password: $_password');
      return true;
    } 
      // print('Form is invalid. Email: $_email, password: $_password');
   return   false;
  }

  void validateAndSubmit(){
    if (validateAndSave()){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Pagee'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value!.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? 'Password cant\t be empty' : null,
              onSaved: (value) => _password = value!,
            ),
            ElevatedButton(
              onPressed: validateAndSubmit,
              child: Text('Log in'),
            )
          ]),
        ),
      ),
    );
  }
}
