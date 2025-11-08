import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'challenge_home_screen.dart';
import 'profile_screen.dart';
import 'image_source_screen.dart';
import 'card_news_detail_screen.dart';

class CardNewsScreen extends StatelessWidget {
  const CardNewsScreen({super.key});

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
                      top: 125 * scaleY,
                      left: 11 * scaleX,
                      right: 11 * scaleX,
                      bottom: 16 * scaleY,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card Grid - 2 columns
                        _buildCardRow(
                          context: context,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          cards: [
                            _CardData(
                              image: 'assets/e5f7a4f3aea45c2fe9ef0dde35e2f655bbb31fde.png',
                              subtitle: '레몬 아이스티에 샷 추가',
                              title: '색다른 음료가\n마시고 싶은 날에는?',
                              content: '평범한 레몬 아이스티에 에스프레소 샷을 추가하면 완전히 새로운 맛을 경험할 수 있습니다. 상큼한 레몬의 산미와 진한 커피의 쓴맛이 조화롭게 어우러져 독특한 맛을 만들어냅니다. 특히 더운 여름날 시원한 음료를 찾을 때 추천하는 조합입니다.',
                            ),
                            _CardData(
                              image: 'assets/0e4b2783b89814d7211de2ab6b4dcbbed764c74a.png',
                              subtitle: '연어 깍두기',
                              title: '알레스카 곰도\n이정도는 안 먹어요',
                              content: '신선한 연어와 매콤한 깍두기의 조합은 생각보다 훨씬 강렬합니다. 연어의 부드러운 식감과 깍두기의 아삭한 식감, 그리고 매콤한 맛이 어우러져 독특한 경험을 선사합니다. 하지만 맵기를 잘 못 드시는 분들은 주의하세요!',
                            ),
                          ],
                        ),
                        SizedBox(height: 12 * scaleY),
                        _buildCardRow(
                          context: context,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          cards: [
                            _CardData(
                              image: 'assets/0a2d598227c3dbb46badecd19f21c22408ba3872.png',
                              subtitle: '말차튀소',
                              title: '드디어 떴다!\n성심당 말차튀소',
                              content: '대전의 유명한 베이커리 성심당에서 새롭게 출시한 말차튀소는 말차의 고소한 맛과 튀김의 바삭함이 조화를 이룬 특별한 메뉴입니다. 부드러운 말차 크림과 바삭한 튀김 껍질의 조합이 입안에서 환상적인 식감을 만들어냅니다. 성심당을 방문하신다면 꼭 맛보세요!',
                            ),
                            _CardData(
                              image: 'assets/f1e46c0e7e0a292009e96ac98f5749754783b935.png',
                              subtitle: '육회+칼빔면',
                              title: '칼국수, 육회, 나\n셋의 만남 너무 기쁘다',
                              content: '신선한 육회와 시원한 칼국수의 만남은 정말 환상적입니다. 육회의 부드러운 식감과 칼국수의 쫄깃한 면발, 그리고 깔끔한 국물이 어우러져 한 끼 식사로 완벽합니다. 특히 여름철 시원한 국물 요리를 찾을 때 추천하는 조합입니다.',
                            ),
                          ],
                        ),
                        SizedBox(height: 12 * scaleY),
                        _buildCardRow(
                          context: context,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          cards: [
                            _CardData(
                              image: 'assets/22762110bc28e4b65e268856cde32dccebcd5dfc.png',
                              subtitle: '훠궈',
                              title: '하이디라오에서 맛보는 정통 훠궈의 맛',
                              content: '하이디라오는 중국의 유명한 훠궈 체인점으로, 정통 중국식 훠궈의 맛을 경험할 수 있는 곳입니다. 다양한 고기와 야채를 선택하여 자신만의 훠궈를 만들 수 있으며, 매콤한 국물과 부드러운 고기의 조합이 일품입니다. 친구들과 함께 가면 더욱 즐거운 식사가 될 것입니다.',
                            ),
                            _CardData(
                              image: 'assets/afb5649b5b0300513903deb3ffe8fb3f14962e3e.png',
                              subtitle: '아귀찜',
                              title: '여기서 끝이 아니다~~ 아귀콩나물미나리대파미더덕다시마참기름까지들어간 아귀찜!',
                              content: '아귀찜은 아귀와 다양한 채소를 함께 조린 한국의 전통 요리입니다. 아귀의 부드러운 살과 콩나물, 미나리, 대파, 미더덕, 다시마, 참기름 등이 어우러져 깊고 풍부한 맛을 만들어냅니다. 특히 밥과 함께 먹으면 더욱 맛있습니다. 다양한 재료가 조화를 이루는 이 요리는 한국 음식의 깊이를 느낄 수 있는 특별한 메뉴입니다.',
                            ),
                          ],
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
              // Nav Bar - Figma: left: 0, top: 30
              Positioned(
                left: 0,
                top: 30 * scaleY,
                right: 0,
                child: Container(
                  width: screenWidth,
                  height: 55 * scaleY,
                  padding: EdgeInsets.symmetric(horizontal: 24 * scaleX),
                  child: Stack(
                    children: [
                      // Back Button
                      Positioned(
                        left: 24 * scaleX,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 20 * scaleX,
                            height: 20 * scaleY,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20 * scaleX,
                              color: const Color(0xFFE86339),
                            ),
                          ),
                        ),
                      ),
                      // Title
                      Center(
                        child: Text(
                          '카드 뉴스',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF1F2024),
                            fontSize: 14 * scaleX,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Filter Buttons - Figma: left: 16, top: 70
              Positioned(
                left: 16 * scaleX,
                top: 70 * scaleY,
                right: 16 * scaleX,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 정렬 (Sort) Button
                    Container(
                      height: 36 * scaleY,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12 * scaleX,
                        vertical: 8 * scaleY,
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFC5C6CC),
                          ),
                          borderRadius: BorderRadius.circular(12 * scaleX),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 12 * scaleX,
                            height: 12 * scaleY,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8F9098),
                            ),
                            child: Icon(
                              Icons.sort,
                              size: 12 * scaleX,
                              color: const Color(0xFF8F9098),
                            ),
                          ),
                          SizedBox(width: 8 * scaleX),
                          Text(
                            '정렬',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF1F2024),
                              fontSize: 12 * scaleX,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12 * scaleX,
                            ),
                          ),
                          SizedBox(width: 8 * scaleX),
                          Container(
                            width: 10 * scaleX,
                            height: 10 * scaleY,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 10 * scaleX,
                              color: const Color(0xFFE86339),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 필터 (Filter) Button
                    Container(
                      height: 36 * scaleY,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12 * scaleX,
                        vertical: 8 * scaleY,
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFC5C6CC),
                          ),
                          borderRadius: BorderRadius.circular(12 * scaleX),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 12 * scaleX,
                            height: 12 * scaleY,
                            child: Icon(
                              Icons.tune,
                              size: 12 * scaleX,
                              color: const Color(0xFFE86339),
                            ),
                          ),
                          SizedBox(width: 8 * scaleX),
                          Text(
                            '필터',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF1F2024),
                              fontSize: 12 * scaleX,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12 * scaleX,
                            ),
                          ),
                          SizedBox(width: 8 * scaleX),
                          Container(
                            width: 20 * scaleX,
                            height: 20 * scaleY,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE86339),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20 * scaleX),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 10 * scaleX,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5 * scaleX,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                      // 카드뉴스 (Card News) - Active
                      _buildTabItem(
                        icon: Icons.grid_view,
                        label: '카드뉴스',
                        isActive: true,
                        scaleX: scaleX,
                        scaleY: scaleY,
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

  Widget _buildCardRow({
    required BuildContext context,
    required double scaleX,
    required double scaleY,
    required List<_CardData> cards,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cards.map((card) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: cards.indexOf(card) == 0 ? 12 * scaleX : 0,
              left: cards.indexOf(card) == 1 ? 12 * scaleX : 0,
            ),
            child: _buildCard(
              context: context,
              scaleX: scaleX,
              scaleY: scaleY,
              card: card,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required double scaleX,
    required double scaleY,
    required _CardData card,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardNewsDetailScreen(
              image: card.image,
              subtitle: card.subtitle,
              title: card.title,
              content: card.content,
            ),
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF8F9FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16 * scaleX),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 120 * scaleY,
              child: Image.asset(
                card.image,
                width: double.infinity,
                height: 120 * scaleY,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 120 * scaleY,
                    color: const Color(0xFFE8E9F1),
                    child: Icon(
                      Icons.image,
                      size: 40 * scaleX,
                      color: const Color(0xFFC5C6CC),
                    ),
                  );
                },
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(16 * scaleX),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16 * scaleY),
                  // Subtitle
                  Text(
                    card.subtitle,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF1F2024),
                      fontSize: 12 * scaleX,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.12 * scaleX,
                      height: 1.33,
                    ),
                  ),
                  SizedBox(height: 4 * scaleY),
                  // Title
                  Text(
                    card.title,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF1F2024),
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
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

class _CardData {
  final String image;
  final String subtitle;
  final String title;
  final String content;

  _CardData({
    required this.image,
    required this.subtitle,
    required this.title,
    required this.content,
  });
}

