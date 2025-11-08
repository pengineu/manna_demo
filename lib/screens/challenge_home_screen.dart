import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'card_news_screen.dart';
import 'profile_screen.dart';
import 'image_source_screen.dart';
import 'challenge_step_selection_screen.dart';
import 'friend_status_screen.dart';

class ChallengeHomeScreen extends StatefulWidget {
  const ChallengeHomeScreen({super.key});

  @override
  State<ChallengeHomeScreen> createState() => _ChallengeHomeScreenState();
}

class _ChallengeHomeScreenState extends State<ChallengeHomeScreen> {
  List<int> _selectedSpicyChallengeSteps = [];
  List<int> _selectedTraditionalChallengeSteps = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Figma design size: 375 x 829
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 829;

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
                      left: 21 * scaleX,
                      right: 21 * scaleX,
                      bottom: 32 * scaleY,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main Challenge Card - "나의 챌린지 현황 배경" (x: 21, y: 63, width: 329, height: 489)
                        Container(
                          width: 329 * scaleX,
                          padding: EdgeInsets.all(16 * scaleX),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F9FE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16 * scaleX),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header Section - "위쪽 텍스트" (x: 36, y: 78, width: 197, height: 47)
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // 강조선 (x: 36, y: 94, width: 158, height: 13) - 노란색 강조선 (먼저 그리기)
                                  Positioned(
                                    left: 0,
                                    top: 16 * scaleY,
                                    child: Container(
                                      width: 158 * scaleX,
                                      height: 13 * scaleY,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(2 * scaleX),
                                      ),
                                    ),
                                  ),
                                  // 텍스트를 위로 올리기 (나중에 그리기)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // "나의 챌린지 현황" title with "(7/10)"
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '나의 챌린지 현황',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF1F2024),
                                              fontSize: 20 * scaleX,
                                              fontWeight: FontWeight.w700,
                                              height: 1.45,
                                            ),
                                          ),
                                          Text(
                                            '(7/ 10)',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF1F2024),
                                              fontSize: 12 * scaleX,
                                              fontWeight: FontWeight.w400,
                                              height: 1.33,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4 * scaleY),
                                      // Subtitle
                                      Text(
                                        '한국 음식에 대한 두려움을 한번에 해결해 보세요!',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF1F2024),
                                          fontSize: 12 * scaleX,
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16 * scaleY),
                              // Challenge Steps Box - "챌린지 스텝 박스" (x: 31, y: 141, width: 309, height: 228)
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16 * scaleX),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12 * scaleX),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Challenge Section 1 - "한국 매운맛 챌린지"
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '한국 매운맛 챌린지',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF1F2024),
                                            fontSize: 14 * scaleX,
                                            fontWeight: FontWeight.w700,
                                            height: 1.25,
                                          ),
                                        ),
                                        SizedBox(height: 16 * scaleY),
                                        // Stepper
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              1,
                                              isActive: _selectedSpicyChallengeSteps.contains(1),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 매운맛 챌린지',
                                                _selectedSpicyChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedSpicyChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              2,
                                              isActive: _selectedSpicyChallengeSteps.contains(2),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 매운맛 챌린지',
                                                _selectedSpicyChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedSpicyChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              3,
                                              isActive: _selectedSpicyChallengeSteps.contains(3),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 매운맛 챌린지',
                                                _selectedSpicyChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedSpicyChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              4,
                                              isActive: _selectedSpicyChallengeSteps.contains(4),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 매운맛 챌린지',
                                                _selectedSpicyChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedSpicyChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              5,
                                              isActive: _selectedSpicyChallengeSteps.contains(5),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 매운맛 챌린지',
                                                _selectedSpicyChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedSpicyChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12 * scaleY),
                                    // Challenge Section 2 - "전통음식 챌린지" (x: 32, y: 255, width: 300, height: 91)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '한국 전통음식 챌린지',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF1F2024),
                                            fontSize: 14 * scaleX,
                                            fontWeight: FontWeight.w700,
                                            height: 1.25,
                                          ),
                                        ),
                                        SizedBox(height: 16 * scaleY),
                                        // Stepper
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              1,
                                              isActive: _selectedTraditionalChallengeSteps.contains(1),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 전통음식 챌린지',
                                                _selectedTraditionalChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedTraditionalChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              2,
                                              isActive: _selectedTraditionalChallengeSteps.contains(2),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 전통음식 챌린지',
                                                _selectedTraditionalChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedTraditionalChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              3,
                                              isActive: _selectedTraditionalChallengeSteps.contains(3),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 전통음식 챌린지',
                                                _selectedTraditionalChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedTraditionalChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              4,
                                              isActive: _selectedTraditionalChallengeSteps.contains(4),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 전통음식 챌린지',
                                                _selectedTraditionalChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedTraditionalChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                            _buildStep(
                                              scaleX,
                                              scaleY,
                                              5,
                                              isActive: _selectedTraditionalChallengeSteps.contains(5),
                                              onTap: () => _navigateToStepSelection(
                                                context,
                                                '한국 전통음식 챌린지',
                                                _selectedTraditionalChallengeSteps,
                                                (steps) {
                                                  setState(() {
                                                    _selectedTraditionalChallengeSteps = steps;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12 * scaleY),
                                    // Pagination Dots (x: 143, y: 351, width: 72, height: 8)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(5, (index) {
                                        final isActive = index < 2; // First two are orange-red
                                        return Container(
                                          margin: EdgeInsets.symmetric(horizontal: 4 * scaleX),
                                          width: 8 * scaleX,
                                          height: 8 * scaleY,
                                          decoration: BoxDecoration(
                                            color: isActive ? const Color(0xFFE86339) : const Color(0xFFD4D6DD),
                                            shape: BoxShape.circle,
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16 * scaleY),
                              // Tip Section with Character - "팁박스" (x: 39, y: 404, width: 203, height: 111)
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // Tip speech bubble
                                  Container(
                                    width: 191 * scaleX,
                                    padding: EdgeInsets.all(16 * scaleX),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF2E3036),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12 * scaleX),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Tip',
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 14 * scaleX,
                                            fontWeight: FontWeight.w700,
                                            height: 1.43,
                                          ),
                                        ),
                                        SizedBox(height: 8 * scaleY),
                                        Text(
                                          '처음부터 너무 매운 음식을 도전하지 말고 가장 맵지 않은 튀김 우동부터 시작하면 좋습니다.',
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 12 * scaleX,
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Arrow pointing left - "Polygon 3" (x: 242, y: 417, width: 17, height: 19) - 좌우반전
                                  Positioned(
                                    right: -8 * scaleX,
                                    top: 20 * scaleY,
                                    child: CustomPaint(
                                      size: Size(17 * scaleX, 19 * scaleY),
                                      painter: _ArrowPainter(isLeft: true),
                                    ),
                                  ),
                                  // 캐릭터 (x: 179, y: 378, width: 191, height: 153) - 다람쥐
                                  Positioned(
                                    left: 158 * scaleX,
                                    top: -26 * scaleY,
                                    child: Container(
                                      width: 191 * scaleX,
                                      height: 153 * scaleY,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8 * scaleX),
                                        child: Image.asset(
                                          'assets/IMG_13.png',
                                          width: 191 * scaleX,
                                          height: 153 * scaleY,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: 191 * scaleX,
                                              height: 153 * scaleY,
                                              color: const Color(0xFFE8E9F1),
                                              child: Icon(
                                                Icons.pets,
                                                size: 60 * scaleX,
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
                            ],
                          ),
                        ),
                        SizedBox(height: 16 * scaleY),
                        // Bottom Cards - Rank and Friends
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 챌린지 랭크 (x: 21, y: 575, width: 155, height: 132)
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16 * scaleX),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8F9FE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12 * scaleX),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '챌린지 랭크',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF1F2024),
                                        fontSize: 12 * scaleX,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25,
                                      ),
                                    ),
                                    SizedBox(height: 8 * scaleY),
                                    // Group 1384 1 (x: 44, y: 605, width: 113, height: 72) - 골드 코인 아이콘
                                    Container(
                                      width: 74 * scaleX,
                                      height: 42 * scaleY,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8 * scaleX),
                                        child: Image.asset(
                                          'assets/IMG_14.png',
                                          width: 74 * scaleX,
                                          height: 42 * scaleY,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: 74 * scaleX,
                                              height: 42 * scaleY,
                                              color: const Color(0xFFFFD700),
                                              child: Icon(
                                                Icons.emoji_events,
                                                size: 30 * scaleX,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4 * scaleY),
                                    Text(
                                      '골드',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF1F2024),
                                        fontSize: 12 * scaleX,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 19 * scaleX),
                            // 친구 현황 (x: 195, y: 575, width: 155, height: 132)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FriendStatusScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16 * scaleX),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF8F9FE),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12 * scaleX),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '친구 현황',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF1F2024),
                                              fontSize: 12 * scaleX,
                                              fontWeight: FontWeight.w700,
                                              height: 1.25,
                                            ),
                                          ),
                                          SizedBox(height: 8 * scaleY),
                                          // man 2 (x: 240, y: 601, width: 71, height: 80) - 친구 아이콘
                                          Container(
                                            width: 60 * scaleX,
                                            height: 60 * scaleY,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8 * scaleX),
                                              child: Image.asset(
                                                'assets/IMG_15.png',
                                                width: 60 * scaleX,
                                                height: 60 * scaleY,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Container(
                                                    width: 60 * scaleX,
                                                    height: 60 * scaleY,
                                                    color: const Color(0xFF4A90E2),
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 30 * scaleX,
                                                      color: Colors.white,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // "9/10" positioned at bottom right (x: 307, y: 684)
                                      Positioned(
                                        right: 16 * scaleX,
                                        bottom: 16 * scaleY,
                                        child: Text(
                                          '9 / 10',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF1F2024),
                                            fontSize: 12 * scaleX,
                                            fontWeight: FontWeight.w600,
                                            height: 1.25,
                                          ),
                                        ),
                                      ),
                                    ],
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
              ),
              // iOS Status Bar
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
                        '챌린지',
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
              // Bottom Tab Bar
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
                      // 챌린지 (Challenge) - Active
                      _buildTabItem(
                        icon: Icons.search,
                        label: '챌린지',
                        isActive: true,
                        scaleX: scaleX,
                        scaleY: scaleY,
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

  Widget _buildStep(
    double scaleX,
    double scaleY,
    int stepNumber, {
    required bool isActive,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32 * scaleX,
            height: 32 * scaleY,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFE86339) : Colors.white,
              shape: BoxShape.circle,
              border: isActive ? null : Border.all(
                color: const Color(0xFFE8E9F1),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '$stepNumber',
                style: GoogleFonts.inter(
                  color: isActive ? Colors.white : const Color(0xFF71727A),
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 4 * scaleY),
          Text(
            'Step',
            style: GoogleFonts.inter(
              color: const Color(0xFF1F2024),
              fontSize: 10 * scaleX,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToStepSelection(
    BuildContext context,
    String challengeName,
    List<int> currentSteps,
    Function(List<int>) onStepsSelected,
  ) async {
    final result = await Navigator.push<List<int>>(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeStepSelectionScreen(
          challengeName: challengeName,
          currentSteps: currentSteps,
        ),
      ),
    );

    if (result != null) {
      onStepsSelected(result);
    }
  }

  static Widget _buildTabItem({
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

class _ArrowPainter extends CustomPainter {
  final bool isLeft;
  
  _ArrowPainter({this.isLeft = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E3036)
      ..style = PaintingStyle.fill;

    final path = Path();
    if (isLeft) {
      // Draw triangle arrow pointing left
      path.moveTo(size.width, size.height / 2);
      path.lineTo(0, 0);
      path.lineTo(0, size.height);
      path.close();
    } else {
      // Draw triangle arrow pointing right
      path.moveTo(0, size.height / 2);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
