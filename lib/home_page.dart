import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/product_detail_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/profile_page.dart';
import 'package:e_commerce_app/chat_list_page.dart';
import 'package:e_commerce_app/widgets/category_card.dart';
import 'package:e_commerce_app/widgets/product_card.dart';

/*
Widget HomePage adalah halaman utama aplikasi e-commerce yang menampilkan:
- AppBar dengan tombol search dan cart
- Daftar kategori produk
- Daftar produk best selling
- Bottom navigation bar dengan efek melengkung
*/

// HomePage adalah StatefulWidget karena memerlukan perubahan state (untuk bottom navigation)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indeks untuk bottom navigation bar

  // Daftar produk best selling (data dummy)
  final List<Product> bestSellingProducts = [
    Product(
      id: '1',
      name: 'Summer T-Shirt',
      price: 29.99,
      image: 'assets/images/tshirt.jpg',
      rating: 4.5,
      description: 'Comfortable cotton t-shirt for summer',
    ),
    // Produk lainnya...
  ];

  /*
  Method build() adalah method wajib yang harus diimplementasikan dalam setiap widget.
  Method ini dipanggil oleh Flutter untuk membangun tampilan widget.
  BuildContext context: Berisi informasi tentang lokasi widget dalam pohon widget.
  */
  @override
  Widget build(BuildContext context) {
    // Scaffold adalah struktur dasar layout material design
    return Scaffold(
      // AppBar: Bagian atas halaman yang berisi judul dan action buttons
      appBar: AppBar(
        title: const Text('Discover'), // Judul halaman
        actions: [
          // Tombol search
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),

          // Tombol cart dengan badge (notifikasi jumlah item)
          IconButton(
            icon: badges.Badge(
              badgeContent: const Text(
                '3', // Jumlah item di cart
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              // Navigasi ke halaman cart ketika tombol ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),

      // Body: Konten utama halaman
      body: SingleChildScrollView(
        // SingleChildScrollView memungkinkan scrolling ketika konten melebihi layar
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Penataan anak ke kiri
            children: [
              // Bagian Kategori
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16), // Spacer
              // ListView horizontal untuk kategori
              SizedBox(
                height: 120, // Tinggi tetap untuk list kategori
                child: ListView(
                  scrollDirection: Axis.horizontal, // Scroll horizontal
                  children: const [
                    // Widget CategoryCard untuk setiap kategori
                    CategoryCard(
                      title: 'Outfit',
                      icon: Icons.people,
                      color: Colors.purple,
                    ),
                    // Kategori lainnya...
                  ],
                ),
              ),

              const SizedBox(height: 24), // Spacer
              // Bagian Best Selling
              const Text(
                'Best Selling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16), // Spacer
              // GridView untuk menampilkan produk best selling
              GridView.builder(
                shrinkWrap: true, // Menyesuaikan tinggi dengan konten
                physics:
                    const NeverScrollableScrollPhysics(), // Non-aktifkan scroll di dalam grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 16, // Spasi antar kolom
                  mainAxisSpacing: 16, // Spasi antar baris
                  childAspectRatio: 0.7, // Rasio tinggi terhadap lebar item
                ),
                itemCount: bestSellingProducts.length, // Jumlah produk
                itemBuilder: (context, index) {
                  // Widget ProductCard untuk setiap produk
                  return ProductCard(
                    product: bestSellingProducts[index],
                    onTap: () {
                      // Navigasi ke halaman detail produk ketika diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: bestSellingProducts[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar dengan efek melengkung
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex, // Indeks aktif
        height: 60.0, // Tinggi navigation bar
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.deepPurple, // Warna background
        buttonBackgroundColor: Colors.deepPurple, // Warna tombol aktif
        backgroundColor: Colors.transparent, // Warna background transparan
        animationCurve: Curves.easeInOut, // Jenis animasi
        animationDuration: const Duration(milliseconds: 300), // Durasi animasi
        onTap: (index) {
          // Handler ketika item navigation bar diklik
          setState(() {
            _currentIndex = index; // Update indeks aktif
          });

          // Navigasi ke halaman sesuai dengan indeks
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatListPage()),
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
      ),
    );
  }
}
