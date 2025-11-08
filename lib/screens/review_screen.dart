import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart_item.dart';
import 'home_screen.dart';

class ReviewScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const ReviewScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  // 각 아이템별 별점과 리뷰 텍스트
  final Map<int, int> _ratings = {}; // key: index, value: rating (1-5)
  final Map<int, String> _reviews = {}; // key: index, value: review text

  @override
  void initState() {
    super.initState();
    // 초기 별점을 5로 설정
    for (int i = 0; i < widget.cartItems.length; i++) {
      _ratings[i] = 5;
      _reviews[i] = '';
    }
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
                    '식사 후 리뷰',
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
            // Review Items List
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                child: Column(
                  children: [
                    SizedBox(height: 24 * scaleY),
                    ...widget.cartItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final cartItem = entry.value;
                      return _buildReviewItem(
                        index,
                        cartItem,
                        scaleX,
                        scaleY,
                      );
                    }),
                    SizedBox(height: 24 * scaleY),
                  ],
                ),
              ),
            ),
            // Submit Button
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
              child: SizedBox(
                width: double.infinity,
                height: 48 * scaleY,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: 리뷰 제출 기능 구현
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
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
                    '리뷰 제출',
                    style: GoogleFonts.inter(
                      fontSize: 16 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem(
    int index,
    CartItem cartItem,
    double scaleX,
    double scaleY,
  ) {
    final item = cartItem.menuItem;
    final rating = _ratings[index] ?? 5;

    return Container(
      margin: EdgeInsets.only(bottom: 24 * scaleY),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu Item Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16 * scaleX),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FE),
              borderRadius: BorderRadius.circular(12 * scaleX),
            ),
            child: Row(
              children: [
                // Menu Image
                Container(
                  width: 52 * scaleX,
                  height: 52 * scaleY,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E9F1),
                    borderRadius: BorderRadius.circular(8 * scaleX),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8 * scaleX),
                    child: item.imagePath != null
                        ? Image.asset(
                            item.imagePath!,
                            width: 52 * scaleX,
                            height: 52 * scaleY,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.restaurant,
                                size: 28 * scaleX,
                                color: const Color(0xFFC5C6CC),
                              );
                            },
                          )
                        : Icon(
                            Icons.restaurant,
                            size: 28 * scaleX,
                            color: const Color(0xFFC5C6CC),
                          ),
                  ),
                ),
                SizedBox(width: 12 * scaleX),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                // Star Rating
                _buildStarRating(index, rating, scaleX, scaleY),
              ],
            ),
          ),
          SizedBox(height: 16 * scaleY),
          // Review Text Area
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '다른 의견도 있나요?',
                style: GoogleFonts.inter(
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2024),
                  height: 1.25,
                ),
              ),
              SizedBox(height: 8 * scaleY),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12 * scaleX),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FE),
                  borderRadius: BorderRadius.circular(8 * scaleX),
                  border: Border.all(
                    color: const Color(0xFFE8E9F1),
                    width: 1,
                  ),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _reviews[index] = value;
                    });
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: '리뷰를 작성해주세요...',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFC5C6CC),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 14 * scaleX,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1F2024),
                    height: 1.42,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(int index, int rating, double scaleX, double scaleY) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (starIndex) {
        final starNumber = starIndex + 1;
        final isSelected = starNumber <= rating;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _ratings[index] = starNumber;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2 * scaleX),
            child: Icon(
              isSelected ? Icons.star : Icons.star_border,
              size: 20 * scaleX,
              color: isSelected ? const Color(0xFFFFD700) : const Color(0xFFC5C6CC),
            ),
          ),
        );
      }),
    );
  }
}

