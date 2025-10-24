import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/product_detail_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/widgets/product_card.dart' as pc;
import 'package:e_commerce_app/widgets/trendy_product_card.dart' as tpc;

/*
Widget HomePage adalah halaman utama aplikasi e-commerce yang menampilkan:
- AppBar dengan tombol search dan cart
- Daftar kategori produk
- Daftar produk best selling
- Bottom navigation bar dengan efek melengkung
*/

// HomePage diubah menjadi StatelessWidget karena tidak ada state yang perlu diubah di dalamnya.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Daftar produk best selling (data dummy) dipindahkan ke sini
  final List<Product> bestSellingProducts = [
    Product(
      id: '1',
      name: 'Nike Air Max Dn SE',
      price: 180.00,
      image: 'assets/images/AIR-MAX-DN-SE.jpg',
      type: "Hardstyle Shoes",
      description:
          'The Air Max Dn features our Dynamic Air unit system of dual-pressure tubes, creating a responsive sensation with every step. This results in a futuristic design that’s comfortable enough to wear from day to night. Plus, this version sports a gradient treatment on the upper. Go ahead—feel the unreal.',
    ),
    Product(
      id: '2',
      name: 'Nike Zoom Vomero 5',
      price: 170.00,
      image: 'assets/images/NIKE-ZOOM-VOMERO-5.jpg',
      type: "Men's Shoes",
      description:
          'Carve a new lane for yourself in the Zoom Vomero 5—your go-to for depth, durability and easy styling. The richly layered design includes textiles, leather and plastic accents that nod to the Y2K aesthetic.',
    ),
    Product(
      id: '3',
      name: 'Kobe 6 Protro Green Apple',
      price: 160.00,
      image: 'assets/images/KOBE-6-PROTRO-GREEN.jpg',
      type: "Basketball Shoes",
      description:
          "The Kobe 6 Protro is based on a favourite colourway originally released on Christmas Day 2010. It features a scaly, reptile-inspired upper with Lime Green colouring—a playful recolouring of Kobe's Black Mamba persona. Lower, sleeker and faster-looking than before, it's fitted with a large, flexible Air Zoom Turbo unit, responsive foam and scaled-down traction for improved court feel.",
    ),
  ];

  final List<Product> trendsProducts = [
    Product(
      id: '1',
      name: "Air Jordan 1 Retro High OG",
      price: 175.00,
      image: 'assets/images/AIR-JORDAN1.jpg',
      type: "Air Jordan Series",
      description:
          "The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colours and textures give modern expression to an all-time favourite.",
    ),
    Product(
      id: '2',
      name: "Nike Air Force 1 '07",
      price: 99.00,
      image: 'assets/images/NIKE-AF1.jpg',
      type: "Men's Shoes",
      description:
          "Comfortable, durable and timeless—it's number one for a reason. The classic '80s construction pairs smooth leather with bold details for style that tracks whether you're on court or on the go.",
    ),
    Product(
      id: '3',
      name: 'Nike Air Jordan 4 Rare Air',
      price: 205.00,
      image: 'assets/images/AIR-JORDAN4.jpg',
      type: "Air Jordan Series",
      description:
          'The AJ4 "Rare Air" pays homage to unexpected beginnings. When the AJ1 first released, it sparked worldwide acclaim—but not before one too many incorrect samples landed at retail partners around the globe, revealing the imperfect hodgepodge placements of logos, stitches and more. A fresh interpretation of the AJ4 "Rare Air" series is here. The premium mix of leather and suede combine with signature Jumpman DNA colors to honor Jordan heritage. Nike Air heel branding, stamped "Rare Air" insoles and removable tongue patches create a rare edition that reminds us how to turn flaws into awes.',
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
    // Digunakan untuk membuat widget responsif (mengatasi overflow)
    final screenHeight = MediaQuery.of(context).size.height;

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
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur Pencarian masih dalam pengembangan.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),

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
                              fontWeight: FontWeight.w900,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("We've send to your email"),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(
                                53,
                                140,
                                23,
                                1,
                              ),
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

              const SizedBox(height: 24), // Spacer
              // Mengatasi overflow: Menggunakan persentase tinggi layar (misalnya 65%)
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.65, // Dibuat responsif
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/featured-banner-1.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jordan Trunner LX',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'No Misses',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),

                          // Shop Button
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Sorry this isn't avalaible in your country",
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 12,
                              ),
                              elevation: 0, // No shadow
                            ),
                            child: const Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Mengatasi overflow: Menggunakan persentase tinggi layar (misalnya 65%)
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.65, // Dibuat responsif
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/featured-banner-2.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Metcon 10',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Strength Starts Here',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),

                          // Shop Button
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Sorry this isn't avalaible in your country",
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 12,
                              ),
                              elevation: 0, // No shadow
                            ),
                            child: const Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  childAspectRatio: 0.8, // Rasio tinggi terhadap lebar item
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

              SizedBox(
                height: 220, // Adjust height as needed for your card
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendsProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: tpc.TrendyProductCard(
                        product: trendsProducts[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: trendsProducts[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
