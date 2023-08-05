import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

import '../screen/profile/profileUpdateScreen.dart';

AppBar TaskAppBar(context,ProfileData){
  return AppBar(
        backgroundColor: colorGreen,
        flexibleSpace: Container(
          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Row(
            children: [
               CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 24,
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => profileUpdateScreen())),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipOval(
                     // child: Image.memory(ShowBase64Image(ProfileData['photo'])),
                      child: Image.network("https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png")
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${ProfileData['firstName']} ${ProfileData['lastName']}',style: Head7Text(colorWhite),),
                    Text(ProfileData['email'],style: Head9Text(colorWhite),)
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
               await RemoveToken();
               Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);

              },
              icon: const Icon(Icons.output)
          )
        ],

  );
}