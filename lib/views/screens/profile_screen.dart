import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_donor/models/user.dart';
import 'package:sp_donor/services/profile.dart';
import 'package:sp_donor/services/user.dart';
import 'package:sp_donor/util/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _calculateAge(String birthDate) {
    DateTime dob = DateTime.parse(birthDate);
    Duration dur = DateTime.now().difference(dob);
    String differenceInYears = (dur.inDays / 365).floor().toString();
    return Text(differenceInYears + ' years');
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider manageProfile = Provider.of<ProfileProvider>(context);
    User user = Provider.of<UserProvider>(context).user;

    return FutureBuilder(
      future: manageProfile.getProfile(user.id!),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!['status'] && snapshot.data!['data'].isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        // clear user data from local storage
                        UserPrefences().removeUser().then(
                              (value) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/login',
                                (Route<dynamic> route) => false,
                              ),
                            );
                      },
                      icon: Icon(Icons.logout)),
                ],
              ),
              body: Center(
                child: Text('No profile found.'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/createProfile',
                  );
                },
                child: Icon(Icons.add),
              ),
            );
          }
          if (!snapshot.data!['status']) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        // clear user data from local storage
                        UserPrefences().removeUser().then(
                              (value) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/login',
                                (Route<dynamic> route) => false,
                              ),
                            );
                      },
                      icon: Icon(Icons.logout)),
                ],
              ),
              body: Center(
                child: Text(snapshot.data!['message']),
              ),
            );
          }

          Map<String, dynamic> profile = snapshot.data!['data'];
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    final Future<Map<String, dynamic>> deleteProfile =
                        manageProfile.deleteProfile(profile['id']);

                    deleteProfile.then(
                      (response) {
                        if (response['status']) {
                          Navigator.pushReplacementNamed(context, '/profile');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response['message']),
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                    onPressed: () {
                      // clear user data from local storage
                      UserPrefences().removeUser().then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                              (Route<dynamic> route) => false,
                            ),
                          );
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Name'),
                    subtitle: Text(profile['name']),
                  ),
                  ListTile(
                    leading: Icon(Icons.height),
                    title: Text('Height'),
                    subtitle: Text(profile['height'].toString() + ' M'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('Weight'),
                    subtitle: Text(profile['weight'].toString() + ' Kgs.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Age'),
                    subtitle: _calculateAge(profile['birth_date']),
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('Ethnicity'),
                    subtitle: Text(profile['ethnicity']),
                  ),
                  ListTile(
                    leading: Icon(Icons.visibility),
                    title: Text('Eye color'),
                    subtitle: Text(profile['eye_color']),
                  ),
                  ListTile(
                    leading: Icon(Icons.face),
                    title: Text('Hair color'),
                    subtitle: Text(profile['hair_color']),
                  ),
                  ListTile(
                    leading: Icon(Icons.face_outlined),
                    title: Text('Complexion'),
                    subtitle: Text(profile['complexion']),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Education'),
                    subtitle: Text(profile['education']),
                  ),
                  ListTile(
                    leading: Icon(Icons.bloodtype),
                    title: Text('Blood Type'),
                    subtitle: Text(profile['bloodtype'].toString()),
                  ),
                  ListTile(
                    leading: Icon(Icons.stars),
                    title: Text('Interests'),
                    subtitle: Text(profile['interests'].toString()),
                  ),
                  ListTile(
                    leading: Icon(Icons.golf_course),
                    title: Text('Hobbies'),
                    subtitle: Text(profile['hobbies'].toString()),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editProfile',
                    arguments: profile);
              },
              child: Icon(Icons.edit),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    // clear user data from local storage
                    UserPrefences().removeUser().then(
                          (value) => Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (Route<dynamic> route) => false,
                          ),
                        );
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
