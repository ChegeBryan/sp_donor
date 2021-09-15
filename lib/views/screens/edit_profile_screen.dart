import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_donor/models/user.dart';
import 'package:sp_donor/services/user.dart';
import 'package:sp_donor/views/screens/parts/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final _args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: EditProfileForm(profile: _args, userId: user.id!),
      ),
    );
  }
}
