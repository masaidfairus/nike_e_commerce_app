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
        primarySwatch:
            Colors.green, // Warna utama aplikasi (gunakan MaterialColor bawaan)
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ), // Font default untuk seluruh teks dalam aplikasi
        // Konfigurasi AppBar secara global
        appBarTheme: const AppBarTheme(
          elevation: 0, // Menghilangkan shadow di bawah AppBar
          centerTitle: true, // Judul AppBar di tengah
          iconTheme: IconThemeData(
            color: Colors.black,
          ), // Warna icon AppBar hitam
          titleTextStyle: TextStyle(
            // Style teks judul AppBar
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
        '/home': (context) => const HomePage(), // Route ke halaman beranda
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
