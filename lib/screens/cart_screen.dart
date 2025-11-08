import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart_item.dart';
import 'order_screen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.cartItems);
  }

  int get _totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  String get _formattedTotalPrice {
    return '${_totalPrice.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}원';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 812;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Nav Bar
            Container(
              height: 56 * scaleY,
              padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20 * scaleX,
                      color: const Color(0xFF1F2024),
                    ),
                  ),
                  // Title
                  Text(
                    '장바구니',
                    style: GoogleFonts.inter(
                      fontSize: 18 * scaleX,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F2024),
                    ),
                  ),
                  // Spacer
                  SizedBox(width: 20 * scaleX),
                ],
              ),
            ),
            // Cart Items List
            Expanded(
              child: _cartItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 80 * scaleX,
                            color: const Color(0xFFC5C6CC),
                          ),
                          SizedBox(height: 16 * scaleY),
                          Text(
                            '장바구니가 비어있습니다',
                            style: GoogleFonts.inter(
                              fontSize: 16 * scaleX,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF71727A),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                        child: Column(
                          children: [
                            SizedBox(height: 24 * scaleY),
                            ...List.generate(_cartItems.length, (index) {
                              final item = _cartItems[index];
                              return Column(
                                children: [
                                  _buildCartItem(item, scaleX, scaleY),
                                  if (index < _cartItems.length - 1)
                                    Divider(
                                      color: const Color(0xFFE8E9F1),
                                      height: 1,
                                      thickness: 1,
                                    ),
                                ],
                              );
                            }),
                            SizedBox(height: 24 * scaleY),
                          ],
                        ),
                      ),
                    ),
            ),
            // Bottom Section (Total and Order Button)
            if (_cartItems.isNotEmpty)
              Container(
                padding: EdgeInsets.all(24 * scaleX),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1F2024),
                          ),
                        ),
                        Text(
                          _formattedTotalPrice,
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1F2024),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16 * scaleY),
                    // Order Button
                    SizedBox(
                      width: double.infinity,
                      height: 48 * scaleY,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderScreen(
                                cartItems: _cartItems,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE86339),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12 * scaleX),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          '다음으로',
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem cartItem, double scaleX, double scaleY) {
    final item = cartItem.menuItem;
    
    return Container(
      width: double.infinity,
      height: 100 * scaleY,
      padding: EdgeInsets.symmetric(vertical: 12 * scaleY),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu Image
          Container(
            width: 90 * scaleX,
            height: 100 * scaleY,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E9F1),
              borderRadius: BorderRadius.circular(8 * scaleX),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8 * scaleX),
              child: item.imagePath != null
                  ? Image.asset(
                      item.imagePath!,
                      width: 90 * scaleX,
                      height: 100 * scaleY,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.restaurant,
                          size: 40 * scaleX,
                          color: const Color(0xFFC5C6CC),
                        );
                      },
                    )
                  : Icon(
                      Icons.restaurant,
                      size: 40 * scaleX,
                      color: const Color(0xFFC5C6CC),
                    ),
            ),
          ),
          SizedBox(width: 16 * scaleX),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Spice Icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menu Name with red underline if spicy
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                item.name,
                                style: GoogleFonts.inter(
                                  fontSize: 14 * scaleX,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F2024),
                                  height: 1.25,
                                ),
                              ),
                              if (item.spiceLevel >= 3)
                                Positioned(
                                  bottom: -2,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 2,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 4 * scaleY),
                          if (item.details != null)
                            Text(
                              item.details!,
                              style: GoogleFonts.inter(
                                fontSize: 12 * scaleX,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF71727A),
                                height: 1.33,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Spice Icon
                    if (item.spiceLevel > 0)
                      Container(
                        width: 26 * scaleX,
                        height: 26 * scaleY,
                        margin: EdgeInsets.only(left: 8 * scaleX),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE86339),
                          borderRadius: BorderRadius.circular(4 * scaleX),
                        ),
                        child: Center(
                          child: Text(
                            '🌶️',
                            style: TextStyle(fontSize: 16 * scaleX),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 12 * scaleY),
                // Quantity and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Input
                    Container(
                      width: 77 * scaleX,
                      height: 32 * scaleY,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FE),
                        borderRadius: BorderRadius.circular(8 * scaleX),
                        border: Border.all(
                          color: const Color(0xFFE8E9F1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (cartItem.quantity > 1) {
                                setState(() {
                                  cartItem.quantity--;
                                });
                              } else {
                                setState(() {
                                  _cartItems.remove(cartItem);
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: 16 * scaleX,
                              color: const Color(0xFF1F2024),
                            ),
                          ),
                          Text(
                            '${cartItem.quantity}',
                            style: GoogleFonts.inter(
                              fontSize: 14 * scaleX,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2024),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartItem.quantity++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 16 * scaleX,
                              color: const Color(0xFF1F2024),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Price
                    Text(
                      cartItem.formattedTotalPrice,
                      style: GoogleFonts.inter(
                        fontSize: 14 * scaleX,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2024),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

