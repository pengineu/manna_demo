import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../models/food_info.dart';
import '../widgets/taste_hexagon_chart.dart';
import 'home_screen.dart';

class FoodResultScreen extends StatelessWidget {
  final String imagePath;
  final FoodInfo foodInfo;

  const FoodResultScreen({
    super.key,
    required this.imagePath,
    required this.foodInfo,
  });

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
                  // Photo Section
                  Container(
                    width: screenWidth,
                    height: 326 * scaleY,
                    color: const Color(0xFF1F2024),
                    child: Stack(
                      children: [
                        // Image (File or Asset)
                        _buildImage(imagePath, screenWidth, scaleX, scaleY),
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
                        // Spice level icon
                        Positioned(
                          top: 24 * scaleY,
                          left: 24 * scaleX,
                          child: _buildSpiceIcon(foodInfo.spiceLevel, scaleX, scaleY),
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
                        // Food Info Section
                        _buildFoodInfoSection(foodInfo, scaleX, scaleY),
                        SizedBox(height: 24 * scaleY),
                        // Menu Box (맛 분석 리포트)
                        _buildMenuBox(foodInfo, scaleX, scaleY),
                        SizedBox(height: 24 * scaleY),
                        // Local Review Section
                        _buildLocalReviewSection(foodInfo, scaleX, scaleY),
                        SizedBox(height: 24 * scaleY),
                        // Sticker Explanation
                        _buildStickerExplanation(scaleX, scaleY),
                        SizedBox(height: 24 * scaleY + MediaQuery.of(context).padding.bottom),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpiceIcon(int spiceLevel, double scaleX, double scaleY) {
    if (spiceLevel == 0) return const SizedBox.shrink();
    
    return Container(
      width: 22 * scaleX,
      height: 22 * scaleY,
      decoration: BoxDecoration(
        color: const Color(0xFFE86339),
        borderRadius: BorderRadius.circular(4 * scaleX),
      ),
      child: Center(
        child: Text(
          '🌶️',
          style: TextStyle(fontSize: 14 * scaleX),
        ),
      ),
    );
  }

  Widget _buildFoodInfoSection(FoodInfo foodInfo, double scaleX, double scaleY) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with heart and play button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${foodInfo.name} [${foodInfo.nameEnglish}]',
                    style: GoogleFonts.inter(
                      fontSize: 18 * scaleX,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F2024),
                      height: 1.22,
                    ),
                  ),
                  SizedBox(height: 4 * scaleY),
                  Text(
                    '당신이 좋아하는 음식과 비슷해요',
                    style: GoogleFonts.inter(
                      fontSize: 12 * scaleX,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF71727A),
                      height: 1.42,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                // Play button
                Container(
                  width: 20 * scaleX,
                  height: 20 * scaleY,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE86339),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 12 * scaleX,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12 * scaleX),
                // Heart button
                Icon(
                  Icons.favorite_border,
                  size: 20 * scaleX,
                  color: const Color(0xFF1F2024),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16 * scaleY),
        // Tags
        Wrap(
          spacing: 8 * scaleX,
          runSpacing: 8 * scaleY,
          children: foodInfo.tags.map((tag) {
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
                tag,
                style: GoogleFonts.inter(
                  fontSize: 12 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1F2024),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMenuBox(FoodInfo foodInfo, double scaleX, double scaleY) {
    return Container(
      padding: EdgeInsets.all(16 * scaleX),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(16 * scaleX),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 맛 분석 리포트
          Text(
            '맛 분석 리포트',
            style: GoogleFonts.inter(
              fontSize: 14 * scaleX,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2024),
              height: 1.25,
            ),
          ),
          SizedBox(height: 16 * scaleY),
          // 6각형 그래프
          Center(
            child: TasteHexagonChart(
              tasteSweet: foodInfo.tasteSweet,
              tasteSalty: foodInfo.tasteSalty,
              tasteSour: foodInfo.tasteSour,
              tasteBitter: foodInfo.tasteBitter,
              tasteSpicy: foodInfo.tasteSpicy,
              tasteGreasy: foodInfo.tasteGreasy,
            ),
          ),
          SizedBox(height: 16 * scaleY),
          // 음식 소개
          _buildInfoSection(
            '음식 소개',
            foodInfo.description,
            scaleX,
            scaleY,
          ),
          SizedBox(height: 16 * scaleY),
          // 음식 매칭 정도
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '음식 매칭 정도',
                style: GoogleFonts.inter(
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2024),
                  height: 1.25,
                ),
              ),
              SizedBox(height: 8 * scaleY),
              // Progress bar
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 8 * scaleY,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8E9F1),
                      borderRadius: BorderRadius.circular(4 * scaleX),
                    ),
                  ),
                  Container(
                    width: double.infinity * foodInfo.matchLevel,
                    height: 8 * scaleY,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE86339),
                      borderRadius: BorderRadius.circular(4 * scaleX),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8 * scaleY),
              Text(
                '${(foodInfo.matchLevel * 100).toInt()}% 매칭',
                style: GoogleFonts.inter(
                  fontSize: 12 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF71727A),
                ),
              ),
            ],
          ),
          SizedBox(height: 16 * scaleY),
          // 들어간 재료
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '들어간 재료',
                style: GoogleFonts.inter(
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2024),
                  height: 1.25,
                ),
              ),
              SizedBox(height: 8 * scaleY),
              Wrap(
                spacing: 8 * scaleX,
                runSpacing: 8 * scaleY,
                children: foodInfo.ingredients.map((ingredient) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12 * scaleX,
                      vertical: 6 * scaleY,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12 * scaleX),
                    ),
                    child: Text(
                      ingredient,
                      style: GoogleFonts.inter(
                        fontSize: 12 * scaleX,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1F2024),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 16 * scaleY),
          // 식감 특성
          _buildInfoSection(
            '식감 특성',
            foodInfo.texture,
            scaleX,
            scaleY,
          ),
          SizedBox(height: 16 * scaleY),
          // 우리나라 음식과 비슷한 음식
          _buildInfoSection(
            '우리나라 음식과 비슷한 음식',
            foodInfo.similarKoreanFoods.join(', '),
            scaleX,
            scaleY,
          ),
          SizedBox(height: 16 * scaleY),
          // 유사 맛 음식
          _buildInfoSection(
            '유사 맛 음식',
            foodInfo.similarTasteFoods.join(', '),
            scaleX,
            scaleY,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content, double scaleX, double scaleY) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14 * scaleX,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2024),
            height: 1.25,
          ),
        ),
        SizedBox(height: 8 * scaleY),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 12 * scaleX,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF71727A),
            height: 1.42,
          ),
        ),
      ],
    );
  }

  Widget _buildLocalReviewSection(FoodInfo foodInfo, double scaleX, double scaleY) {
    return Container(
      padding: EdgeInsets.all(16 * scaleX),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(16 * scaleX),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '자국 리뷰',
            style: GoogleFonts.inter(
              fontSize: 14 * scaleX,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2024),
              height: 1.25,
            ),
          ),
          SizedBox(height: 16 * scaleY),
          if (foodInfo.sampleReview != null) ...[
            Row(
              children: [
                // Avatar
                Container(
                  width: 35 * scaleX,
                  height: 35 * scaleY,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E9F1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 20 * scaleX,
                    color: const Color(0xFF71727A),
                  ),
                ),
                SizedBox(width: 12 * scaleX),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'tlswo2025',
                        style: GoogleFonts.inter(
                          fontSize: 14 * scaleX,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2024),
                        ),
                      ),
                      Text(
                        '리뷰 ${foodInfo.reviewCount}개',
                        style: GoogleFonts.inter(
                          fontSize: 12 * scaleX,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF71727A),
                        ),
                      ),
                    ],
                  ),
                ),
                // Star rating
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < foodInfo.averageRating.toInt()
                          ? Icons.star
                          : Icons.star_border,
                      size: 18 * scaleX,
                      color: const Color(0xFFFFD700),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 12 * scaleY),
            Text(
              foodInfo.sampleReview!,
              style: GoogleFonts.inter(
                fontSize: 12 * scaleX,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1F2024),
                height: 1.42,
              ),
            ),
            SizedBox(height: 8 * scaleY),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '더보기',
                style: GoogleFonts.inter(
                  fontSize: 12 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF71727A),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStickerExplanation(double scaleX, double scaleY) {
    return Container(
      padding: EdgeInsets.all(16 * scaleX),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(16 * scaleX),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '음식 아이콘 설명',
            style: GoogleFonts.inter(
              fontSize: 14 * scaleX,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2024),
              height: 1.25,
            ),
          ),
          SizedBox(height: 16 * scaleY),
          // Spice level explanation
          Row(
            children: [
              Container(
                width: 22 * scaleX,
                height: 22 * scaleY,
                decoration: BoxDecoration(
                  color: const Color(0xFFE86339),
                  borderRadius: BorderRadius.circular(4 * scaleX),
                ),
                child: Center(
                  child: Text(
                    '🌶️',
                    style: TextStyle(fontSize: 14 * scaleX),
                  ),
                ),
              ),
              SizedBox(width: 12 * scaleX),
              Text(
                '후추 정도',
                style: GoogleFonts.inter(
                  fontSize: 12 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1F2024),
                ),
              ),
            ],
          ),
          SizedBox(height: 12 * scaleY),
          // TODO: 할랄/비건 아이콘 설명 추가
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath, double screenWidth, double scaleX, double scaleY) {
    // File 경로인지 확인
    final file = File(imagePath);
    if (file.existsSync()) {
      return Image.file(
        file,
        width: screenWidth,
        height: 326 * scaleY,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImagePlaceholder(screenWidth, scaleX, scaleY);
        },
      );
    } else {
      // Asset 경로로 시도
      return Image.asset(
        imagePath,
        width: screenWidth,
        height: 326 * scaleY,
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
      height: 326 * scaleY,
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
}

