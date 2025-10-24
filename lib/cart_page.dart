import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/cart_item.dart';
import 'package:e_commerce_app/models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(
      product: Product(
        id: '1',
        name: 'Nike Air Max Dn SE',
        price: 180.00,
        image: 'assets/images/AIR-MAX-DN-SE.jpg',
        type: "Hardstyle Shoes",
        description:
            'The Air Max Dn features our Dynamic Air unit system of dual-pressure tubes, creating a responsive sensation with every step. This results in a futuristic design that’s comfortable enough to wear from day to night. Plus, this version sports a gradient treatment on the upper. Go ahead—feel the unreal.',
      ),
      quantity: 1,
      size: '44',
    ),
    CartItem(
      product: Product(
        id: '2',
        name: 'Air Jordan 1 Retro High OG"',
        price: 175.00,
        image: 'assets/images/AIR-JORDAN1.jpg',
        type: "Men's Shoes",
        description:
            "The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colours and textures give modern expression to an all-time favourite.",
      ),
      quantity: 2,
      size: '45',
    ),
    CartItem(
      product: Product(
        id: '3',
        name: 'Nike MAG Back to the Future',
        price: 19450.00,
        image: 'assets/images/NIKE-MAG.jpg',
        type: "Collector's Shoes",
        description:
            "Immortalized in the 1989 film 'Back to the Future II,' the Nike Mag was finally released to the public in September 2011. Though the shoe lacks the self-lacing feature, it’s an aesthetic match to its filmic counterpart, complete with an electroluminescent Nike logo on the strap and glowing LED arrays at the midsole and heel. The 2011 production run was limited to 1500 pairs and released through charity eBay auctions where proceeds went directly to Michael J. Fox’s Foundation in finding a cure for Parkinson's Disease.",
      ),
      quantity: 1,
      size: '45',
    ),
  ];

  double get _totalPrice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.product.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.5,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(53, 140, 23, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromRGBO(157, 255, 125, 0.2),
                                    ),
                                    child: Text(
                                      'Size: ${item.size}',
                                      style: TextStyle(
                                        color: Color.fromRGBO(53, 140, 23, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${item.product.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.5,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _cartItems.removeAt(index);
                                    });
                                  },
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 16,
                                          color: Colors.black54,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item.quantity--;
                                          });
                                          if (item.quantity <= 0) {
                                            _cartItems.removeAt(index);
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      width: 50,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        item.quantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromRGBO(53, 140, 23, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Color.fromRGBO(53, 140, 23, 1),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey, thickness: 0.5),
                  ],
                );
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\$${_totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          '\$5.99',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${(_totalPrice + 5.99).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(53, 140, 23, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(53, 140, 23, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '🎉 Checkout berhasil disimulasikan! Total \$${(_totalPrice + 5.99).toStringAsFixed(2)}',
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
