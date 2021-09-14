import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_donor/models/user.dart';
import 'package:sp_donor/services/auth.dart';
import 'package:sp_donor/services/user.dart';
import 'package:sp_donor/util/shared_preferences.dart';
import 'package:sp_donor/views/auth/screens/login.dart';
import 'package:sp_donor/views/auth/screens/register.dart';
import 'package:sp_donor/views/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Sp Donor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<User>(
          future: UserPrefences().getUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.email == null) {
                return LoginScreen();
              }
              Provider.of<UserProvider>(context).setUser(snapshot.data);
              return ProfileScreen();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
