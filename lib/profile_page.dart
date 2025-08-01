import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/profile_option.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:e_commerce_app/chat_list_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [IconButton(icon: const Icon(Icons.edit), onPressed: () {})],
      ),
      body: SingleChildScrollView(
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'ronaldo@nike.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ProfileOption(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {},
            ),
            ProfileOption(icon: Icons.help, title: 'Help', onTap: () {}),
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
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex, // Indeks aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatListPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          }
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.black),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 140, 23, 1),
              ),
            ),
            selectedColor: Color.fromRGBO(121, 239, 82, 1),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.chat, size: 30, color: Colors.black),
            title: Text(
              "Chat",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 140, 23, 1),
              ),
            ),
            selectedColor: Color.fromRGBO(121, 239, 82, 1),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart, size: 30, color: Colors.black),
            //CURENTLY DUMMY aka. BUG HERE I CANT FIX IT SORRY
            title: Text("", style: TextStyle(fontSize: 14)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Color.fromRGBO(53, 140, 23, 1),
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 140, 23, 1),
              ),
            ),
            selectedColor: Color.fromRGBO(85, 187, 51, 1),
          ),
        ],
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
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
