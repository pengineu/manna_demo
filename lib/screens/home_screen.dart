import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Figma design size: 402 x 874
    final scaleX = screenWidth / 402;
    final scaleY = screenHeight / 874;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // iOS Status Bar (44px height at top) - only one
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 44 * scaleY,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Time (9:41)
                    Padding(
                      padding: EdgeInsets.only(left: 27 * scaleX),
                      child: Text(
                        '9:41',
                        style: GoogleFonts.inter(
                          fontSize: 15 * scaleX,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2024),
                          letterSpacing: -0.165 * scaleX,
                        ),
                      ),
                    ),
                    // Status icons (right side)
                    Padding(
                      padding: EdgeInsets.only(right: 14 * scaleX),
                      child: Row(
                        children: [
                          Icon(
                            Icons.signal_cellular_alt,
                            size: 14 * scaleX,
                            color: const Color(0xFF1F2024),
                          ),
                          SizedBox(width: 4 * scaleX),
                          Icon(
                            Icons.wifi,
                            size: 14 * scaleX,
                            color: const Color(0xFF1F2024),
                          ),
                          SizedBox(width: 4 * scaleX),
                          Icon(
                            Icons.battery_full,
                            size: 14 * scaleX,
                            color: const Color(0xFF1F2024),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content area - scrollable
            Positioned(
              top: 44 * scaleY,
              left: 0,
              right: 0,
              bottom: 88 * scaleY, // Tab bar height
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Search Bar
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 29 * scaleY,
                      bottom: 24 * scaleY,
                    ),
                    child: Center(
                      child: Container(
                        width: 311 * scaleX,
                        height: 44 * scaleY,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12 * scaleX),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16 * scaleX),
                              child: Icon(
                                Icons.search,
                                size: 20 * scaleX,
                                color: const Color(0xFF71727A),
                              ),
                            ),
                            SizedBox(width: 8 * scaleX),
                            Text(
                              '오늘은 어떤 음식을 드실래요?',
                              style: GoogleFonts.inter(
                                fontSize: 14 * scaleX,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF71727A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Home Feed Image with Recommendation Overlay
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32 * scaleX),
                    child: Stack(
                      children: [
                        // Main food image (IMG_7)
                        Container(
                          width: 311 * scaleX,
                          height: 406 * scaleY,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * scaleX),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12 * scaleX),
                            child: Image.asset(
                              'assets/IMG_7.png',
                              width: 311 * scaleX,
                              height: 406 * scaleY,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFFE8E9F1),
                                  child: Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 60 * scaleX,
                                      color: const Color(0xFFC5C6CC),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // Recommendation Card Overlay (bottom part) with gradient
                        // Figma: 추천 텍스트 프레임 y=401, height=132 (이미지 하단과 일치)
                        // 이미지: y=127, height=406 (하단: y=533)
                        // 추천 텍스트: y=401, height=132 (하단: y=533) - 이미지 하단과 일치
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 311 * scaleX,
                            constraints: BoxConstraints(
                              maxHeight: 132 * scaleY,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16 * scaleX,
                              vertical: 10 * scaleY,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.0, 0.3, 0.6, 1.0],
                                colors: [
                                  const Color(0xFFFFF4E4).withOpacity(0.0),
                                  const Color(0xFFFFF4E4).withOpacity(0.3),
                                  const Color(0xFFFFF4E4).withOpacity(0.7),
                                  const Color(0xFFFFF4E4).withOpacity(0.95),
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '오늘의 추천',
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * scaleX,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1F2024),
                                  ),
                                ),
                                SizedBox(height: 0.25 * scaleY),
                                Text(
                                  '순두부 찌개 어때요?',
                                  style: GoogleFonts.inter(
                                    fontSize: 16 * scaleX,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1F2024),
                                  ),
                                ),
                                SizedBox(height: 0.25 * scaleY),
                                Text(
                                  '맵기 3/5 - 돼지고기, 두부, 파',
                                  style: GoogleFonts.inter(
                                    fontSize: 12 * scaleX,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF71727A),
                                  ),
                                ),
                                SizedBox(height: 0.25 * scaleY),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFE86339),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8 * scaleX),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6 * scaleY,
                                            horizontal: 8 * scaleX,
                                          ),
                                          minimumSize: Size(0, 32 * scaleY),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          '레시피 보기',
                                          style: GoogleFonts.inter(
                                            fontSize: 12 * scaleX,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8 * scaleX),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                            color: Color(0xFFE86339),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8 * scaleX),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6 * scaleY,
                                            horizontal: 8 * scaleX,
                                          ),
                                          minimumSize: Size(0, 32 * scaleY),
                                        ),
                                        child: Text(
                                          '다음 추천',
                                          style: GoogleFonts.inter(
                                            fontSize: 12 * scaleX,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFE86339),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16 * scaleY),
                  // Scan History Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9 * scaleX),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '스캔 기록',
                                style: GoogleFonts.inter(
                                  fontSize: 14 * scaleX,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F2024),
                                ),
                              ),
                              Text(
                                '모두 보기',
                                style: GoogleFonts.inter(
                                  fontSize: 12 * scaleX,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF71727A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16 * scaleY),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                          child: Row(
                            children: [
                              // IMG_8
                              Padding(
                                padding: EdgeInsets.only(right: 9 * scaleX),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8 * scaleX),
                                  child: Image.asset(
                                    'assets/IMG_8.png',
                                    width: 72 * scaleX,
                                    height: 72 * scaleY,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 72 * scaleX,
                                        height: 72 * scaleY,
                                        color: const Color(0xFFE8E9F1),
                                        child: Icon(
                                          Icons.image,
                                          size: 30 * scaleX,
                                          color: const Color(0xFFC5C6CC),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // IMG_9
                              Padding(
                                padding: EdgeInsets.only(right: 9 * scaleX),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8 * scaleX),
                                  child: Image.asset(
                                    'assets/IMG_9.png',
                                    width: 72 * scaleX,
                                    height: 72 * scaleY,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 72 * scaleX,
                                        height: 72 * scaleY,
                                        color: const Color(0xFFE8E9F1),
                                        child: Icon(
                                          Icons.image,
                                          size: 30 * scaleX,
                                          color: const Color(0xFFC5C6CC),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // IMG_10
                              Padding(
                                padding: EdgeInsets.only(right: 9 * scaleX),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8 * scaleX),
                                  child: Image.asset(
                                    'assets/IMG_10.png',
                                    width: 72 * scaleX,
                                    height: 72 * scaleY,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 72 * scaleX,
                                        height: 72 * scaleY,
                                        color: const Color(0xFFE8E9F1),
                                        child: Icon(
                                          Icons.image,
                                          size: 30 * scaleX,
                                          color: const Color(0xFFC5C6CC),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // IMG_11
                              Padding(
                                padding: EdgeInsets.only(right: 9 * scaleX),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8 * scaleX),
                                  child: Image.asset(
                                    'assets/IMG_11.png',
                                    width: 72 * scaleX,
                                    height: 72 * scaleY,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 72 * scaleX,
                                        height: 72 * scaleY,
                                        color: const Color(0xFFE8E9F1),
                                        child: Icon(
                                          Icons.image,
                                          size: 30 * scaleX,
                                          color: const Color(0xFFC5C6CC),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16 * scaleY),
                  // Today's Food Expression Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9 * scaleX),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24 * scaleX),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12 * scaleX),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8 * scaleX),
                            child: Image.asset(
                              'assets/IMG_12.png',
                              width: 72 * scaleX,
                              height: 72 * scaleY,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 72 * scaleX,
                                  height: 72 * scaleY,
                                  color: const Color(0xFFE8E9F1),
                                  child: Center(
                                    child: Icon(
                                      Icons.chat_bubble_outline,
                                      size: 30 * scaleX,
                                      color: const Color(0xFFC5C6CC),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 16 * scaleX),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '오늘의 음식 표현',
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * scaleX,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1F2024),
                                  ),
                                ),
                                SizedBox(height: 8 * scaleY),
                                Text(
                                  'If you like window seats, "I would like to reserve a seat by the window" in korean is "창가 자리를 예약하고 싶습니다." (Changga jarireul yeyakhago sipseumnida.)',
                                  style: GoogleFonts.inter(
                                    fontSize: 12 * scaleX,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF71727A),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16 * scaleY),
                ],
              ),
            ),
          ),
          // Tab Bar (bottom)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 88 * scaleY,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -2 * scaleY),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _TabBarItem(
                    icon: Icons.home,
                    label: 'Home',
                    isSelected: true,
                    scaleX: scaleX,
                    scaleY: scaleY,
                  ),
                  _TabBarItem(
                    icon: Icons.search,
                    label: 'Search',
                    isSelected: false,
                    scaleX: scaleX,
                    scaleY: scaleY,
                  ),
                  _TabBarItem(
                    icon: Icons.favorite_border,
                    label: 'Favorites',
                    isSelected: false,
                    scaleX: scaleX,
                    scaleY: scaleY,
                  ),
                  _TabBarItem(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    isSelected: false,
                    scaleX: scaleX,
                    scaleY: scaleY,
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final double scaleX;
  final double scaleY;

  const _TabBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.scaleX,
    required this.scaleY,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 24 * scaleX,
          color: isSelected
              ? const Color(0xFFE86339)
              : const Color(0xFF71727A),
        ),
        SizedBox(height: 4 * scaleY),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10 * scaleX,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected
                ? const Color(0xFFE86339)
                : const Color(0xFF71727A),
          ),
        ),
      ],
    );
  }
}

