import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart_item.dart';
import 'review_screen.dart';

class OrderScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const OrderScreen({
    super.key,
    required this.cartItems,
  });

  int get _totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
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
                    '주문서',
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
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16 * scaleY),
                    // Instruction Text Box
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16 * scaleX),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FE),
                        borderRadius: BorderRadius.circular(12 * scaleX),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이 화면을 종업원에게 보여주세요!',
                            style: GoogleFonts.inter(
                              fontSize: 16 * scaleX,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F2024),
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: 8 * scaleY),
                          Text(
                            '제가 대신 주문해 드릴게요',
                            style: GoogleFonts.inter(
                              fontSize: 14 * scaleX,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF71727A),
                              height: 1.42,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16 * scaleY),
                    // Description Text
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16 * scaleX),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FE),
                        borderRadius: BorderRadius.circular(12 * scaleX),
                      ),
                      child: Text(
                        '제가 주문하기 어려워 화면 보여드립니다. 아래 있는 것으로 주문해주세요!',
                        style: GoogleFonts.inter(
                          fontSize: 14 * scaleX,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1F2024),
                          height: 1.42,
                        ),
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
                    // Menu Box
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16 * scaleX),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FE),
                        borderRadius: BorderRadius.circular(12 * scaleX),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '주문 메뉴',
                            style: GoogleFonts.inter(
                              fontSize: 16 * scaleX,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F2024),
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: 16 * scaleY),
                          // Order Items
                          ...cartItems.map((item) => _buildOrderItem(
                            item,
                            scaleX,
                            scaleY,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 24 * scaleY),
                  ],
                ),
              ),
            ),
            // Bottom Section (Total and Order Button)
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
                            builder: (context) => ReviewScreen(
                              cartItems: cartItems,
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
                        '주문하기',
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

  Widget _buildOrderItem(CartItem cartItem, double scaleX, double scaleY) {
    final item = cartItem.menuItem;
    
    // 상세 옵션 텍스트 생성 (details가 있으면 사용, 없으면 기본값)
    final optionText = item.details ?? '기본';
    
    return Container(
      margin: EdgeInsets.only(bottom: 12 * scaleY),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            item.name,
            style: GoogleFonts.inter(
              fontSize: 14 * scaleX,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2024),
              height: 1.25,
            ),
          ),
          SizedBox(height: 8 * scaleY),
          // Quantity and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Option Tag
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * scaleX,
                  vertical: 4 * scaleY,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6 * scaleX),
                  border: Border.all(
                    color: const Color(0xFFE8E9F1),
                    width: 1,
                  ),
                ),
                child: Text(
                  optionText,
                  style: GoogleFonts.inter(
                    fontSize: 12 * scaleX,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1F2024),
                    height: 1.17,
                  ),
                ),
              ),
              // Quantity and Price
              Row(
                children: [
                  Text(
                    'x${cartItem.quantity}',
                    style: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF71727A),
                      height: 1.21,
                    ),
                  ),
                  SizedBox(width: 8 * scaleX),
                  Text(
                    cartItem.formattedTotalPrice,
                    style: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2024),
                      height: 1.21,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

