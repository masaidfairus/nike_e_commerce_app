import 'package:e_commerce_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:e_commerce_app/chat_detail_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/profile_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int _currentIndex = 1; // Indeks untuk bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/nike-logo.png'),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              index == 0 ? 'Customer Service' : 'Fashion Store ${index + 1}',
              style: TextStyle(
                fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              index == 0
                  ? 'Hello, how can I help you?'
                  : 'Your order has been shipped',
              style: TextStyle(
                fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                color: index == 0 ? Colors.black : Colors.grey,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${index + 1}h ago',
                  style: TextStyle(
                    color: index == 0
                        ? Color.fromRGBO(53, 140, 23, 1)
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                if (index == 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(53, 140, 23, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatDetailPage()),
              );
            },
          );
        },
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
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
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
            icon: Icon(
              Icons.chat,
              size: 30,
              color: Color.fromRGBO(53, 140, 23, 1),
            ),
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
            icon: Icon(Icons.person, size: 30, color: Colors.black),
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
}
