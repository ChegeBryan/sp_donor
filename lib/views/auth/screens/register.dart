import 'package:flutter/material.dart';
import 'package:sp_donor/views/auth/parts/form_bottom_text.dart';
import 'package:sp_donor/views/auth/parts/register_form.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.attribution,
                    color: Theme.of(context).primaryColor,
                    size: 56.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
                  Text(
                    'Donor Registration',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              RegisterForm(),
              FormBottomText(
                message: 'Already have an account?',
                actionMessage: 'Login',
                action: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
