import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestore_service.dart';
import '../model/user_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final UsersFireStore usersFireStore = UsersFireStore();
  final currentUser = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo_outlined, color: Colors.blue),
          )
        ],
      ),
      body: FutureBuilder<UserModel?>(
        future: usersFireStore.getUserFromFireStore(currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No user data found"));
          }

          var user = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(
                          "assets/images/761f66c4c9922aac002e575aefd77330.jpg",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Full Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      _buildInfoBox(user.name),

                      const SizedBox(height: 15),

                      const Text("Email Address",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      _buildInfoBox(user.email),

                      const SizedBox(height: 15),

                      const Text("Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      _buildInfoBox("********"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoBox(String value) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
