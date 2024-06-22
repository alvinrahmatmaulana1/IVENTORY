import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final ProfilController profileController = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () => profileController.isLoggedIn.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('../assets/images/hello.png'),
                      ),
                    ),
                    SizedBox(height: 24),
                    ListTile(
                      title: Text(
                        'Nama',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${profileController.users['username']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${profileController.users['email']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Role',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${profileController.users['role']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
