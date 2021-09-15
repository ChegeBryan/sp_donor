import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_donor/services/profile.dart';
import 'package:validators/validators.dart';

class EditProfileForm extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int userId;

  const EditProfileForm({Key? key, required this.profile, required this.userId})
      : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _name;
  late TextEditingController _height;
  late TextEditingController _weight;
  late TextEditingController _birthDate;
  late TextEditingController _eyeColor;
  late TextEditingController _hairColor;
  late TextEditingController _complexion;
  late TextEditingController _education;
  late TextEditingController _bloodtype;
  late TextEditingController _interests;
  late TextEditingController _hobbies;
  late TextEditingController _ethnicity;

  @override
  void initState() {
    _name = TextEditingController(text: widget.profile['name']);
    _birthDate = TextEditingController(text: widget.profile['birth_date']);
    _height = TextEditingController(text: widget.profile['height'].toString());
    _weight = TextEditingController(text: widget.profile['weight'].toString());
    _birthDate = TextEditingController(text: widget.profile['birth_date']);
    _eyeColor = TextEditingController(text: widget.profile['eye_color']);
    _hairColor = TextEditingController(text: widget.profile['hair_color']);
    _complexion = TextEditingController(text: widget.profile['complexion']);
    _education = TextEditingController(text: widget.profile['education']);
    _bloodtype = TextEditingController(text: widget.profile['bloodtype']);
    _interests = TextEditingController(text: widget.profile['interests']);
    _hobbies = TextEditingController(text: widget.profile['hobbies']);
    _ethnicity = TextEditingController(text: widget.profile['ethnicity']);
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _height.dispose();
    _weight.dispose();
    _birthDate.dispose();
    _hairColor.dispose();
    _complexion.dispose();
    _education.dispose();
    _bloodtype.dispose();
    _interests.dispose();
    _hobbies.dispose();
    _ethnicity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profile = Provider.of<ProfileProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _height,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Height in Metres',
              prefixIcon: Icon(Icons.height),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter height.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _weight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight in Kgs',
              prefixIcon: Icon(Icons.fitness_center),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter weight.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _eyeColor,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Eye color',
              prefixIcon: Icon(Icons.visibility),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter eye color.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _birthDate,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              labelText: 'Birth Date',
              prefixIcon: Icon(Icons.event),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter birth date.';
              } else if (!isDate(value)) {
                return 'Please enter a valid date.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _ethnicity,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Ethnicity',
              prefixIcon: Icon(Icons.face),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter ethnicity.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _hairColor,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Hair color',
              prefixIcon: Icon(Icons.face),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter hair color.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _complexion,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Complexion',
              prefixIcon: Icon(Icons.face),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter skin complexion.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _education,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Current/Highest Education level reached',
              prefixIcon: Icon(Icons.school),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter education level.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _bloodtype,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Blood Type',
              prefixIcon: Icon(Icons.bloodtype),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter blood type.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _interests,
            keyboardType: TextInputType.text,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Interests',
              prefixIcon: Icon(Icons.book),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter interests.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          TextFormField(
            controller: _hobbies,
            keyboardType: TextInputType.text,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Interests',
              prefixIcon: Icon(Icons.golf_course),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter interests.';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12.0)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  final Future<Map<String, dynamic>> updateProfile =
                      profile.updateProfile(
                    birthdate: _birthDate.text,
                    bloodtype: _bloodtype.text,
                    complexion: _complexion.text,
                    education: _education.text,
                    ethnicity: _ethnicity.text,
                    eyeColor: _eyeColor.text,
                    hairColor: _hairColor.text,
                    height: _height.text,
                    hobbies: _hobbies.text,
                    interests: _interests.text,
                    name: _name.text,
                    spermBank: 2,
                    userId: widget.userId,
                    weight: _weight.text,
                  );

                  updateProfile.then(
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
                }
              },
              child: Text(
                'Update Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
