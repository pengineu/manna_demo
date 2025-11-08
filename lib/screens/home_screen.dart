import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_news_screen.dart';
import 'challenge_home_screen.dart';
import 'profile_screen.dart';
import 'image_source_screen.dart';

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
        child: Container(
          width: screenWidth,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13 * scaleX),
            ),
          ),
          child: Stack(
            children: [
              // Scrollable content area
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 88 * scaleY + MediaQuery.of(context).padding.bottom,
                child: SingleChildScrollView(
                  child: Container(
                    width: screenWidth,
                    height: 800 * scaleY, // Minimum height for content
                    child: Stack(
                      children: [
                        // Search Bar - Figma: top: 29
            Positioned(
              left: 0,
              top: 29 * scaleY,
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.all(24 * scaleX),
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 311 * scaleX,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16 * scaleX,
                        vertical: 12 * scaleY,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F8FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24 * scaleX),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 16 * scaleX,
                            height: 16 * scaleY,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2E3036),
                            ),
                          ),
                          SizedBox(width: 16 * scaleX),
                          Flexible(
                            child: Text(
                              '오늘은 어떤 음식을 드실래요?',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF8F9098),
                                fontSize: 14 * scaleX,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Main Food Image - Figma: left: 32, top: 127
            Positioned(
              left: 32 * scaleX,
              top: 127 * scaleY,
              child: Container(
                width: 311 * scaleX,
                height: 406 * scaleY,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/IMG_7.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15 * scaleX),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15 * scaleX),
                  child: Image.asset(
                    'assets/IMG_7.png',
                    width: 311 * scaleX,
                    height: 406 * scaleY,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 311 * scaleX,
                        height: 406 * scaleY,
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
            ),
            // Gradient Overlay - Figma: left: 32, top: 401
            Positioned(
              left: 32 * scaleX,
              top: 401 * scaleY,
              child: Opacity(
                opacity: 0.80,
                child: Container(
                  width: 311 * scaleX,
                  height: 132 * scaleY,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.50, -0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [Color(0xFFD9D9D9), Color(0xFF737373)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15 * scaleX),
                        bottomRight: Radius.circular(15 * scaleX),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Recommendation Text and Buttons - Figma: left: 54, top: 406, 426, 445, 477
            Positioned(
              left: 54 * scaleX,
              top: 406 * scaleY,
              child: Text(
                '오늘의 추천',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
            ),
            Positioned(
              left: 54 * scaleX,
              top: 426 * scaleY,
              right: 54 * scaleX,
              child: Text(
                '순두부 찌개 어때요?',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16 * scaleX,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.08 * scaleX,
                ),
              ),
            ),
            Positioned(
              left: 54 * scaleX,
              top: 445 * scaleY,
              right: 54 * scaleX,
              child: Text(
                '맵기 3/5 - 돼지고기, 두부, 파',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
            ),
            Positioned(
              left: 54 * scaleX,
              top: 477 * scaleY,
              child: Container(
                width: 268 * scaleX,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40 * scaleY,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * scaleX,
                          vertical: 12 * scaleY,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE76238),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1.50,
                              color: Color(0xFFE76238),
                            ),
                            borderRadius: BorderRadius.circular(12 * scaleX),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '다른 음식 보기',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: const Color(0xFFEAF2FF),
                              fontSize: 12 * scaleX,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8 * scaleX),
                    Expanded(
                      child: Container(
                        height: 40 * scaleY,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * scaleX,
                          vertical: 12 * scaleY,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE76238),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12 * scaleX),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'AI 설명 보기',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12 * scaleX,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // iOS Status Bar - Figma: left: 13, top: 0
            Positioned(
              left: 13 * scaleX,
              top: 0,
              child: Container(
                width: 375 * scaleX,
                height: 44 * scaleY,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                      left: 19.89 * scaleX,
                      top: 14 * scaleY,
                      child: SizedBox(
                        width: 54 * scaleX,
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF1F2024),
                            fontSize: 15 * scaleX,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.17 * scaleX,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 293 * scaleX,
                      top: 16 * scaleY,
                      child: Container(
                        width: 68 * scaleX,
                        height: 14 * scaleY,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 41 * scaleX,
                              top: -3 * scaleY,
                              child: Text(
                                '􀛨',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1F2024),
                                  fontSize: 17 * scaleX,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21 * scaleX,
                              top: -1 * scaleY,
                              child: Text(
                                '􀙇',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1F2024),
                                  fontSize: 14 * scaleX,
                                  fontWeight: FontWeight.w400,
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
            ),
            // Scan History Section - Figma: left: 9, top: 544
            Positioned(
              left: 9 * scaleX,
              top: 544 * scaleY,
              child: Container(
                width: 371 * scaleX,
                height: 157 * scaleY,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 33 * scaleX,
                      top: 5 * scaleY,
                      child: Text(
                        '스캔 기록',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12 * scaleX,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 302 * scaleX,
                      top: 10 * scaleY,
                      child: Text(
                        '모두 보기',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10 * scaleX,
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                          letterSpacing: 0.15 * scaleX,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33 * scaleX,
                      top: 32 * scaleY,
                      child: _buildScanHistoryImage('assets/IMG_8.png', scaleX, scaleY),
                    ),
                    Positioned(
                      left: 114 * scaleX,
                      top: 32 * scaleY,
                      child: _buildScanHistoryImage('assets/IMG_9.png', scaleX, scaleY),
                    ),
                    Positioned(
                      left: 195 * scaleX,
                      top: 32 * scaleY,
                      child: _buildScanHistoryImage('assets/IMG_10.png', scaleX, scaleY),
                    ),
                    Positioned(
                      left: 276 * scaleX,
                      top: 32 * scaleY,
                      child: _buildScanHistoryImage('assets/IMG_11.png', scaleX, scaleY),
                    ),
                  ],
                ),
              ),
            ),
            // Today's Food Expression Section - Figma: left: 9, top: 669
            Positioned(
              left: 9 * scaleX,
              top: 669 * scaleY,
              child: Container(
                width: 385 * scaleX,
                height: 115 * scaleY,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFC5C6CC),
                    ),
                    borderRadius: BorderRadius.circular(10 * scaleX),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 31 * scaleX,
                      top: 5 * scaleY,
                      child: Text(
                        '오늘의 음식 표현',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12 * scaleX,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 122 * scaleX,
                      top: 24 * scaleY,
                      right: 33 * scaleX,
                      child: Text(
                        'If you like window seats,\n"I would like to reserve\na seat by the window" in korean is\n"창가 자리를 예약하고 싶습니다."\n(Changga jarireul yeyakhago sipseumnida.)',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12 * scaleX,
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                          letterSpacing: 0.12 * scaleX,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33 * scaleX,
                      top: 32 * scaleY,
                      child: Container(
                        width: 72 * scaleX,
                        height: 72 * scaleY,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/IMG_12.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8 * scaleX),
                          ),
                        ),
                        child: ClipRRect(
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
                    ),
                  ],
                ),
              ),
            ),
                      ],
                    ),
                  ),
                ),
              ),
            // Bottom Tab Bar - Fixed at bottom, always visible
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: screenWidth,
                // height: 88 * scaleY + MediaQuery.of(context).padding.bottom,
                padding: EdgeInsets.only(
                  top: 16 * scaleY,
                  left: 16 * scaleX,
                  right: 16 * scaleX,
                  bottom: 32 * scaleY + MediaQuery.of(context).padding.bottom,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 홈 (Home) - Active
                    _buildTabItem(
                      icon: Icons.explore,
                      label: '홈',
                      isActive: true,
                      scaleX: scaleX,
                      scaleY: scaleY,
                    ),
                    // 카드뉴스 (Card News)
                    _buildTabItem(
                      icon: Icons.grid_view,
                      label: '카드뉴스',
                      isActive: false,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CardNewsScreen(),
                          ),
                        );
                      },
                    ),
                    // 스캔 (Scan)
                    _buildTabItem(
                      icon: Icons.camera_alt,
                      label: '스캔',
                      isActive: false,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      onTap: () {
                        _showScanBottomSheet(context, scaleX, scaleY);
                      },
                    ),
                    // 챌린지 (Challenge)
                    _buildTabItem(
                      icon: Icons.search,
                      label: '챌린지',
                      isActive: false,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChallengeHomeScreen(),
                          ),
                        );
                      },
                    ),
                    // 내 프로필 (My Profile)
                    _buildTabItem(
                      icon: Icons.person,
                      label: '내 프로필',
                      isActive: false,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildScanHistoryImage(String assetPath, double scaleX, double scaleY) {
    return Container(
      width: 72 * scaleX,
      height: 72 * scaleY,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8 * scaleX),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8 * scaleX),
        child: Image.asset(
          assetPath,
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
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required double scaleX,
    required double scaleY,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                icon,
                size: 20 * scaleX,
              color: isActive ? const Color(0xFFE86339) : const Color(0xFFD4D6DD),
            ),
            SizedBox(height: 8 * scaleY),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: isActive ? const Color(0xFF1F2024) : const Color(0xFF71727A),
                fontSize: 10 * scaleY,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                height: 1.40,
                letterSpacing: 0.15 * scaleY,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showScanBottomSheet(BuildContext context, double scaleX, double scaleY) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20 * scaleX),
              topRight: Radius.circular(20 * scaleX),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                margin: EdgeInsets.only(top: 12 * scaleY, bottom: 20 * scaleY),
                width: 40 * scaleX,
                height: 4 * scaleY,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4D6DD),
                  borderRadius: BorderRadius.circular(2 * scaleX),
                ),
              ),
              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                child: Column(
                  children: [
                    // 음식/상품 사진
                    SizedBox(
                      width: double.infinity,
                      height: 56 * scaleY,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageSourceScreen(scanType: 'food'),
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
                          '음식/상품 사진',
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12 * scaleY),
                    // 메뉴판
                    SizedBox(
                      width: double.infinity,
                      height: 56 * scaleY,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageSourceScreen(scanType: 'menu'),
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
                          '메뉴판',
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12 * scaleY),
                    // 취소
                    SizedBox(
                      width: double.infinity,
                      height: 56 * scaleY,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF71727A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12 * scaleX),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          '취소',
                          style: GoogleFonts.inter(
                            fontSize: 16 * scaleX,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24 * scaleY + MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
