// Import library material design Flutter dan halaman home
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> _saveEmailLocally(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      await _saveEmailLocally(_emailController.text.trim());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationPage()),
      );
    }
  }

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
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: SingleChildScrollView(
            // SingleChildScrollView agar konten bisa discroll jika keyboard muncul
            padding: const EdgeInsets.all(24.0), // Padding di semua sisi
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Posisi vertikal tengah
              children: [
                // Hero widget untuk animasi transisi halaman
                Hero(
                  tag: 'logo', // Identifier untuk animasi
                  child: Image.asset(
                    'assets/images/nike-logo.png', // Gambar logo
                    height: 100, // Tinggi gambar
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                // Judul Welcome
                const Text(
                  'Welcome Back to Nike',
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10), // Spacer
                // Subjudul
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 30), // Spacer
                // Card untuk form login
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey, // Key untuk form validation
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            helperText: 'Example: email@nike.com',
                            labelText: 'E-mail', // Icon email
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
                            helperText: 'Minimum 6 characters',
                            labelText: 'Password', // Icon gembok
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
                              backgroundColor: const Color.fromRGBO(
                                53,
                                140,
                                23,
                                1,
                              ), // Warna ungu
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Validasi form saat tombol ditekan
                              if (_formKey.currentState!.validate()) {
                                // Navigasi ke HomePage dan ganti halaman saat ini
                                _handleLogin();
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                // Tombol sign up
                TextButton(
                  onPressed: () {}, // Kosong untuk sementara
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.black54),
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
