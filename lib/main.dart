// Import library-library yang diperlukan
import 'package:flutter/material.dart'; // Library dasar Flutter untuk widget material design
// import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Untuk navigation bar dengan bentuk melengkung
// import 'package:badges/badges.dart'
// as badges; // Untuk menampilkan badge/notifikasi count (dipakai sebagai alias 'badges')
// import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Untuk menampilkan rating bintang
// import 'package:clippy_flutter/clippy_flutter.dart'; // Untuk efek clippy/shape khusus pada widget
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart'; // Halaman login custom
import 'home_page.dart'; // Halaman beranda
import 'profile_page.dart'; // Halaman profil user
import 'chat_list_page.dart'; // Halaman daftar chat
import 'chat_detail_page.dart'; // Halaman detail percakapan
import 'product_detail_page.dart'; // Halaman detail produk
import 'cart_page.dart'; // Halaman keranjang belanja
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


// Fungsi main() adalah titik masuk utama aplikasi Flutter
void main() {
  // runApp() menjalankan aplikasi dengan widget MyApp sebagai root widget
  runApp(const MyApp());
}

// MyApp adalah root widget dari aplikasi, merupakan turunan dari StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  }); // Constructor dengan key opsional untuk identifikasi widget

  // Method build() wajib di override pada StatelessWidget
  // Build context menyediakan akses ke lokasi widget dalam tree dan theme
  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget dasar yang mengimplementasikan material design
    return MaterialApp(
      title: 'Nike E-Commerce App',
      debugShowCheckedModeBanner:
          false, // Menyembunyikan banner debug di corner
      // ThemeData mendefinisikan tema dasar aplikasi
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(
              primarySwatch: Colors
                  .grey, // Base for general app elements, could be white/grey
              // accentColor: Colors.purple, // Deprecated, replaced by secondary
            ).copyWith(
              primary: Colors
                  .orange, // This will be the primary color for interactive elements (e.g., focused TextFormField border, floating label)
              secondary: Colors
                  .redAccent, // Another accent color if needed for other widgets
              surface:
                  Colors.white, // Color for cards, sheets (like your login box)
              onSurface: Colors.black87, // Text color on surface
            ),
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Halaman pertama yang ditampilkan saat aplikasi dibuka
      home: const LoginPage(),

      // Daftar route/navigasi yang tersedia dalam aplikasi
      // Route adalah alamat/path ke halaman tertentu
      routes: {
        '/home': (context) => HomePage(), // Route ke halaman beranda
        '/profile': (context) => const ProfilePage(), // Route ke halaman profil
        '/chat-list': (context) => const ChatListPage(), // Route ke daftar chat
        '/chat-detail': (context) =>
            const ChatDetailPage(), // Route ke detail chat
        // Route ke detail produk dengan menerima arguments (data produk)
        '/product-detail': (context) {
          // Mengambil arguments yang dikirim saat navigasi
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          // Mengirim data produk ke ProductDetailPage
          return ProductDetailPage(product: args['product']);
        },

        '/cart': (context) => const CartPage(), // Route ke halaman keranjang
      },
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const ChatListPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: _currentIndex == 0 ? Color(0xFF358C17) : Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            selectedColor: Color(0xFF358C17),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.chat,
              size: 30,
              color: _currentIndex == 1 ? Color(0xFF358C17) : Colors.black,
            ),
            title: Text(
              "Chat",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            selectedColor: Color(0xFF358C17),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: _currentIndex == 2 ? Color(0xFF358C17) : Colors.black,
            ),
            title: Text(
              "Cart",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            selectedColor: Color(0xFF358C17),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: _currentIndex == 3 ? Color(0xFF358C17) : Colors.black,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            selectedColor: Color(0xFF358C17),
          ),
        ],
      ),
    );
  }
}