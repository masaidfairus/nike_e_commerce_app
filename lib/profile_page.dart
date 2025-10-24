import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/profile_option.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? savedEmail;

  @override
  void initState() {
    super.initState();
    _loadSavedEmail();
  }

  Future<void> _loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedEmail = prefs.getString('user_email') ?? 'No email saved';
    });
  }

  Future<void> _clearSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
    setState(() {
      savedEmail = null;
    });
  }

  // Fungsi untuk menampilkan SnackBar pada tombol yang belum berfungsi
  void _showFeatureUnderDevelopment(String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Fitur "$featureName" masih dalam pengembangan.'),
        duration: const Duration(seconds: 2),
      ),
    );
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
        backgroundColor: const Color.fromRGBO(53, 140, 23, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Menambahkan fungsionalitas ke ikon Edit
              _showFeatureUnderDevelopment('Edit Profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PERBAIKAN OVERFLOW: Mengganti height dinamis dengan nilai tetap (200)
            // atau menggunakan LayoutBuilder/Container yang lebih aman
            Container(
              width: double.infinity,
              height: 200, // Nilai tetap yang aman untuk landscape
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 140, 23, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
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
            const SizedBox(height: 30),
            // MENAMBAHKAN FUNGSIONALITAS PADA OPSI MENU
            ProfileOption(
              icon: Icons.person,
              title: 'My Profile',
              onTap: () {
                _showFeatureUnderDevelopment('My Profile');
              },
            ),
            ProfileOption(
              icon: Icons.location_on,
              title: 'Address Management',
              onTap: () {
                _showFeatureUnderDevelopment('Address Management');
              },
            ),
            ProfileOption(
              icon: Icons.support_agent_rounded,
              title: 'Help & Support',
              onTap: () {
                _showFeatureUnderDevelopment('Help & Support');
              },
            ),
            ProfileOption(
              icon: Icons.settings,
              title: 'Setting',
              onTap: () {
                _showFeatureUnderDevelopment('Setting');
              },
            ),
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
              // Asumsi '/login' adalah rute login Anda, ganti jika berbeda
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
