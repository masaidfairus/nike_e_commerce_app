import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/product_detail_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/profile_page.dart';
import 'package:e_commerce_app/chat_list_page.dart';
import 'package:e_commerce_app/widgets/product_card.dart' as pc;
import 'package:e_commerce_app/widgets/trendy_product_card.dart' as tpc;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
      name: 'Nike Air Max Dn SE',
      price: 180.00,
      image: 'assets/images/AIR-MAX-DN-SE.png',
      rating: 4.6,
      description:
          'The Air Max Dn features our Dynamic Air unit system of dual-pressure tubes, creating a responsive sensation with every step. This results in a futuristic design that’s comfortable enough to wear from day to night. Plus, this version sports a gradient treatment on the upper. Go ahead—feel the unreal.',
    ),
    Product(
      id: '2',
      name: 'Nike Zoom Vomero 5',
      price: 170.00,
      image: 'assets/images/NIKE-ZOOM-VOMERO-5.png',
      rating: 4.8,
      description:
          'Carve a new lane for yourself in the Zoom Vomero 5—your go-to for depth, durability and easy styling. The richly layered design includes textiles, leather and plastic accents that nod to the Y2K aesthetic.',
    ),
  ];

  final List<Product> trendsProducts = [
    Product(
      id: '1',
      name: "Air Jordan 1 Retro High OG",
      price: 175.00,
      image: 'assets/images/AIR-JORDAN1.png',
      rating: 4.8,
      description:
          "The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colours and textures give modern expression to an all-time favourite.",
    ),
    Product(
      id: '2',
      name: "Nike Air Force 1 '07",
      price: 99.00,
      image: 'assets/images/NIKE-AF1.png',
      rating: 4.8,
      description:
          "Comfortable, durable and timeless—it's number one for a reason. The classic '80s construction pairs smooth leather with bold details for style that tracks whether you're on court or on the go.",
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/nike-logo.png', // Ganti dengan path logo Anda
            height: 32,
            width: 32,
          ),
        ),
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
              child: const Icon(Icons.local_mall),
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
              Column(
                children: [
                  Image.asset('assets/images/nike-banner.png'),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      // Add Padding around the Text
                      padding: const EdgeInsets.only(
                        left: 0.0,
                      ), // Example: 16 pixels of space on the left
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Just In',
                            style: TextStyle(fontSize: 16, letterSpacing: -0.5),
                          ),
                          const SizedBox(height: 4), // Spasi antara teks
                          const Text(
                            'NOTHING BEATS THE CITY',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const Text(
                            'Built to overcome anything the city throws your way.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8), // Spasi antara teks
                          ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(53, 140, 23, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Text(
                              'Explore Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32), // Spacer
              // Bagian Best Selling
              const Text(
                'New Arrivals Just Landed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
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
                  childAspectRatio: 0.9, // Rasio tinggi terhadap lebar item
                ),
                itemCount: bestSellingProducts.length, // Jumlah produk
                itemBuilder: (context, index) {
                  // Widget ProductCard untuk setiap produk
                  return pc.ProductCard(
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

              const SizedBox(height: 16), // Spacer

              const Text(
                'The Latest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 16), // Spacer

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
                itemCount: trendsProducts.length, // Jumlah produk
                itemBuilder: (context, index) {
                  // Widget TrendyProductCard untuk setiap produk
                  return tpc.TrendyProductCard(
                    product: trendsProducts[index],
                    onTap: () {
                      // Navigasi ke halaman detail produk ketika diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: trendsProducts[index]),
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

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex, // Indeks aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

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
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Color.fromRGBO(53, 140, 23, 1),
            ),
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
            title: Text("", style: TextStyle()),
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
