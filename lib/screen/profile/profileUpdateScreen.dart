import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Style/Style.dart';
import '../../component/TaskAppBar.dart';
import '../../utility/utility.dart';

class profileUpdateScreen extends StatefulWidget {
  const profileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<profileUpdateScreen> createState() => _profileUpdateScreenState();
}

class _profileUpdateScreenState extends State<profileUpdateScreen> {
  int TabIndex = 0;
  Map<String, String> ProfileData = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "photo": DefaultProfilePic,
  };

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _readAppBarData();
    super.initState();
  }

  Future<void> WriteUserData(UserData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', UserData['token']);
    await prefs.setString('email', UserData['data']['email']);
    await prefs.setString('firstName', UserData['data']['firstName']);
    await prefs.setString('lastName',UserData['data']['lastName']);
    await prefs.setString('mobile', UserData['data']['mobile']);
    await prefs.setString('photo', UserData['data']['photo']);
  }


  Future<void> _readAppBarData() async {
    String? email = await ReadUserData('email');
    String? firstName = await ReadUserData('firstName');
    String? lastName = await ReadUserData('lastName');
    String? photo = await ReadUserData('photo');
    setState(() {
      ProfileData = {
        "email": '$email',
        "firstName": '$firstName',
        "lastName": '$lastName',
        "photo": '$photo',
      };
      _firstNameController.text = ProfileData['firstName']!;
      _lastNameController.text = ProfileData['lastName']!;
      _emailController.text = ProfileData['email']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context, ProfileData),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(ProfileData['photo']!),
                radius: 50,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                decoration:AppInputDecoration(ProfileData['firstName'],),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                decoration: AppInputDecoration(ProfileData['lastName'],),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,

                decoration: AppInputDecoration(
                  ProfileData['email'],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Implement the logic for updating the user profile here
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String email = _emailController.text;
                  // Do something with the updated values
                },
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
