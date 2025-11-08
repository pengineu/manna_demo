import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'card_news_screen.dart';
import 'challenge_home_screen.dart';
import 'image_source_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    padding: EdgeInsets.only(
                      top: 100 * scaleY,
                      left: 1 * scaleX,
                      right: 1 * scaleX,
                      bottom: 16 * scaleY,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Info Section
                        Container(
                          width: 374 * scaleX,
                          height: 153 * scaleY,
                          child: Stack(
                            children: [
                              // Avatar
                              Positioned(
                                left: 146.25 * scaleX,
                                top: 8 * scaleY,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 80 * scaleX,
                                      height: 80 * scaleY,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE8E9F1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 50 * scaleX,
                                        color: const Color(0xFFC5C6CC),
                                      ),
                                    ),
                                    // Edit button
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 24 * scaleX,
                                        height: 24 * scaleY,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE86339),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.edit,
                                          size: 12 * scaleX,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Name and subtitle
                              Positioned(
                                left: 107.5 * scaleX,
                                top: 106 * scaleY,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lucas Scott',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF1F2024),
                                        fontSize: 16 * scaleX,
                                        fontWeight: FontWeight.w700,
                                        height: 1.19,
                                      ),
                                    ),
                                    SizedBox(height: 4 * scaleY),
                                    Text(
                                      '락토 베지테리언, 땅콩 알레르기',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF71727A),
                                        fontSize: 12 * scaleX,
                                        fontWeight: FontWeight.w400,
                                        height: 1.33,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 53 * scaleY),
                        // Settings Section
                        Container(
                          width: 375 * scaleX,
                          padding: EdgeInsets.symmetric(horizontal: 16 * scaleX),
                          child: Column(
                            children: [
                              _buildListItem(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                title: '언어 설정',
                                icon: Icons.language,
                                onTap: () {},
                              ),
                              _buildDivider(scaleX),
                              _buildListItem(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                title: '알림 설정',
                                icon: Icons.notifications,
                                onTap: () {},
                              ),
                              _buildDivider(scaleX),
                              _buildListItem(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                title: '프라이버시',
                                icon: Icons.lock,
                                onTap: () {},
                              ),
                              _buildDivider(scaleX),
                              _buildListItem(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                title: '도움말',
                                icon: Icons.help,
                                onTap: () {},
                              ),
                              _buildDivider(scaleX),
                              _buildListItem(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                title: '정보',
                                icon: Icons.info,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // iOS Status Bar - Figma: left: 0, top: 0
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  width: screenWidth,
                  height: 44 * scaleY,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                      ),
                    ],
                  ),
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
                        right: 14 * scaleX,
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
              // Nav Bar - Figma: left: 0, top: 44
              Positioned(
                left: 0,
                top: 44 * scaleY,
                right: 0,
                child: Container(
                  width: screenWidth,
                  height: 56 * scaleY,
                  padding: EdgeInsets.symmetric(horizontal: 16 * scaleX),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '내 프로필',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1F2024),
                          fontSize: 18 * scaleX,
                          fontWeight: FontWeight.w700,
                          height: 1.22,
                        ),
                      ),
                    ],
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
                      // 홈 (Home)
                      _buildTabItem(
                        icon: Icons.explore,
                        label: '홈',
                        isActive: false,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
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
                      // 내 프로필 (My Profile) - Active
                      _buildTabItem(
                        icon: Icons.person,
                        label: '내 프로필',
                        isActive: true,
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
      ),
    );
  }

  Widget _buildListItem({
    required double scaleX,
    required double scaleY,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 343 * scaleX,
        height: 52 * scaleY,
        padding: EdgeInsets.symmetric(horizontal: 16 * scaleX),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20 * scaleX,
                  color: const Color(0xFF1F2024),
                ),
                SizedBox(width: 12 * scaleX),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1F2024),
                    fontSize: 16 * scaleX,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 20 * scaleX,
              color: const Color(0xFFC5C6CC),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(double scaleX) {
    return Container(
      width: 343 * scaleX,
      height: 1,
      color: const Color(0xFFE8E9F1),
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

