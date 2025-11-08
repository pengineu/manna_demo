import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../models/menu_info.dart';
import '../models/menu_item.dart';
import '../models/food_info.dart';
import '../models/cart_item.dart';
import 'food_result_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class MenuResultScreen extends StatefulWidget {
  final String menuImagePath;
  final MenuInfo menuInfo;
  final List<MenuItem> menuItems;

  const MenuResultScreen({
    super.key,
    required this.menuImagePath,
    required this.menuInfo,
    required this.menuItems,
  });

  @override
  State<MenuResultScreen> createState() => _MenuResultScreenState();
}

class _MenuResultScreenState extends State<MenuResultScreen> {
  List<CartItem> _cartItems = [];

  void _addToCart(MenuItem item) {
    setState(() {
      // 기존 아이템 찾기
      final existingItemIndex = _cartItems.indexWhere(
        (cartItem) => cartItem.menuItem.name == item.name,
      );
      
      if (existingItemIndex >= 0) {
        // 이미 장바구니에 있는 경우 수량 증가
        _cartItems[existingItemIndex].quantity++;
      } else {
        // 장바구니에 없는 경우 새로 추가
        _cartItems.add(CartItem(menuItem: item, quantity: 1));
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name}이(가) 장바구니에 추가되었습니다.'),
        duration: const Duration(seconds: 1),
      ),
    );
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
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu Image Section
                  Container(
                    width: screenWidth,
                    height: 210 * scaleY,
                    color: const Color(0xFF1F2024),
                    child: Stack(
                      children: [
                        // Image
                        _buildImage(widget.menuImagePath, screenWidth, scaleX, scaleY),
                        // Close button
                        Positioned(
                          top: 10 * scaleY,
                          left: 24 * scaleX,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Container(
                              width: 20 * scaleX,
                              height: 20 * scaleY,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                size: 16 * scaleX,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // Cart button
                        Positioned(
                          top: 10 * scaleY,
                          right: 24 * scaleX,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(
                                    cartItems: _cartItems,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 40 * scaleX,
                                  height: 40 * scaleY,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 20 * scaleX,
                                    color: Colors.white,
                                  ),
                                ),
                                if (_cartItems.isNotEmpty)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      width: 18 * scaleX,
                                      height: 18 * scaleY,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE86339),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${_cartItems.length}',
                                          style: GoogleFonts.inter(
                                            fontSize: 10 * scaleX,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Details Section
                  Padding(
                    padding: EdgeInsets.all(24 * scaleX),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Restaurant Name
                        Text(
                          widget.menuInfo.name,
                          style: GoogleFonts.inter(
                            fontSize: 18 * scaleX,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1F2024),
                            height: 1.22,
                          ),
                        ),
                        SizedBox(height: 8 * scaleY),
                        // Restaurant Description
                        Text(
                          widget.menuInfo.description,
                          style: GoogleFonts.inter(
                            fontSize: 12 * scaleX,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF71727A),
                            height: 1.42,
                          ),
                        ),
                        SizedBox(height: 16 * scaleY),
                        // Tags
                        Wrap(
                          spacing: 8 * scaleX,
                          runSpacing: 8 * scaleY,
                          children: [
                            _buildTag('한국식 안주', scaleX, scaleY),
                            _buildTag('전통 음식', scaleX, scaleY),
                            _buildTag('추천 메뉴', scaleX, scaleY),
                          ],
                        ),
                        SizedBox(height: 24 * scaleY),
                        // Divider
                        Divider(
                          color: const Color(0xFFE8E9F1),
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(height: 24 * scaleY),
                        // Menu Items
                        ...widget.menuItems.map((item) => _buildMenuItem(context, item, scaleX, scaleY)),
                      ],
                    ),
                  ),
                  SizedBox(height: 24 * scaleY + MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath, double screenWidth, double scaleX, double scaleY) {
    final file = File(imagePath);
    if (file.existsSync()) {
      return Image.file(
        file,
        width: screenWidth,
        height: 210 * scaleY,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImagePlaceholder(screenWidth, scaleX, scaleY);
        },
      );
    } else {
      return Image.asset(
        imagePath,
        width: screenWidth,
        height: 210 * scaleY,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImagePlaceholder(screenWidth, scaleX, scaleY);
        },
      );
    }
  }

  Widget _buildImagePlaceholder(double screenWidth, double scaleX, double scaleY) {
    return Container(
      width: screenWidth,
      height: 210 * scaleY,
      color: const Color(0xFF1F2024),
      child: Center(
        child: Icon(
          Icons.image,
          size: 80 * scaleX,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildTag(String text, double scaleX, double scaleY) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * scaleX,
        vertical: 6 * scaleY,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(12 * scaleX),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12 * scaleX,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF1F2024),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item, double scaleX, double scaleY) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100 * scaleY,
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
                          child: GestureDetector(
                            onTap: () {
                              // 메뉴 클릭 시 음식 정보 화면으로 이동
                              // TODO: 실제 음식 정보를 가져오는 로직 구현
                              // 일단 더미 데이터로 표시
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodResultScreen(
                                    imagePath: item.imagePath ?? 'assets/placeholder.jpg',
                                    foodInfo: FoodInfo.dummy(),
                                  ),
                                ),
                              );
                            },
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
                    // Price and Add to Cart Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        Text(
                          item.price,
                          style: GoogleFonts.inter(
                            fontSize: 14 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1F2024),
                          ),
                        ),
                        // Add to Cart Button
                        GestureDetector(
                          onTap: () {
                            _addToCart(item);
                          },
                          child: Container(
                            width: 32 * scaleX,
                            height: 32 * scaleY,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE86339),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20 * scaleX,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16 * scaleY),
        // Divider
        Divider(
          color: const Color(0xFFE8E9F1),
          height: 1,
          thickness: 1,
        ),
        SizedBox(height: 16 * scaleY),
      ],
    );
  }
}

