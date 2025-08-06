import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/profile_option.dart';
import 'package:shared_preferences/shared_preferences.dart';  

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? savedEmail; // 🔧 BARU

  @override
  void initState() {
    super.initState();
    _loadSavedEmail(); // 🔧 AMBIL email saat halaman dibuka
  }

  // 🔧 BARU: Load email dari shared preferences
  Future<void> _loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedEmail = prefs.getString('user_email') ?? 'No email saved';
    });
  }

  // 🔧 BARU: Hapus email saat logout
  Future<void> _clearSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
    setState(() {
      savedEmail = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Color.fromRGBO(53, 140, 23, 1),
        actions: [IconButton(icon: const Icon(Icons.edit), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.27,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(53, 140, 23, 1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Muslimin Ronaldo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      savedEmail ?? 'Loading...',
                      style: const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ProfileOption(
              icon: Icons.person,
              title: 'My Profile',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.location_on,
              title: 'Address Management',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.support_agent_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            ProfileOption(icon: Icons.settings, title: 'Setting', onTap: () {}),
            ProfileOption(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                _showLogoutDialog(context);
              },
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _clearSavedEmail();
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
