import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_donor/models/user.dart';
import 'package:sp_donor/services/user.dart';
import 'package:sp_donor/views/screens/parts/create_profile_form.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: CreateProfileForm(userId: user.id!),
      ),
    );
  }
}
