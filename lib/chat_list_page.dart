import 'package:flutter/material.dart';
import 'package:e_commerce_app/chat_detail_page.dart';

class ChatListPage extends StatelessWidget {
  // Changed to StatelessWidget
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 1,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 10.0,
              ),
              leading: const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/nike-logo.png'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                index == 0 ? 'Customer Service' : 'Fashion Store ${index + 1}',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Text(
                index == 0
                    ? 'New message from customer service'
                    : 'Your order has been shipped',
                style: TextStyle(
                  letterSpacing: -0.5,
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
                  MaterialPageRoute(
                    builder: (context) => const ChatDetailPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
