// Import library material design Flutter dan halaman home
import 'package:flutter/material.dart';
import 'package:e_commerce_app/home_page.dart';

// LoginPage adalah StatefulWidget karena membutuhkan state management
// untuk form input dan toggle visibility password
class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Constructor dengan key opsional

  @override
  State<LoginPage> createState() => _LoginPageState(); // Membuat state terkait
}

// Kelas state untuk LoginPage
class _LoginPageState extends State<LoginPage> {
  // GlobalKey untuk mengidentifikasi dan memvalidasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengelola input text field
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // State untuk toggle visibility password
  bool _isObscure = true;

  // Method dispose untuk membersihkan controller ketika widget dihapus
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Build method - tempat mendefinisikan UI
  @override
  Widget build(BuildContext context) {
    // Scaffold adalah struktur dasar material design
    return Scaffold(
      // Scaffold tidak memiliki AppBar karena ingin tampilan fullscreen
      body: Container(
        // Background gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Ungu ke biru
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // SingleChildScrollView agar konten bisa discroll jika keyboard muncul
            padding: const EdgeInsets.all(24.0), // Padding di semua sisi
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Posisi vertikal tengah
              children: [
                // Hero widget untuk animasi transisi halaman
                const Hero(
                  tag: 'logo', // Identifier untuk animasi
                  child: Icon(
                    Icons.shopping_bag, // Icon tas belanja
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                // Judul Welcome
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10), // Spacer
                // Subjudul
                const Text(
                  'Sign in to continue',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 30), // Spacer
                // Card untuk form login
                Card(
                  elevation: 8, // Shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey, // Key untuk form validation
                      child: Column(
                        children: [
                          // Field email
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email), // Icon email
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              // Validasi input email
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null; // Return null jika valid
                            },
                          ),
                          const SizedBox(height: 16), // Spacer
                          // Field password
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock), // Icon gembok
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Toggle icon visibility
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure; // Toggle state
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            obscureText: _isObscure, // Toggle visibility text
                            validator: (value) {
                              // Validasi password
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24), // Spacer
                          // Tombol login
                          SizedBox(
                            width: double.infinity, // Lebar penuh
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF6A11CB,
                                ), // Warna ungu
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // Validasi form saat tombol ditekan
                                if (_formKey.currentState!.validate()) {
                                  // Navigasi ke HomePage dan ganti halaman saat ini
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                // Tombol sign up
                TextButton(
                  onPressed: () {}, // Kosong untuk sementara
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
