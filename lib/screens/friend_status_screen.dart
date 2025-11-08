import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendStatusScreen extends StatelessWidget {
  const FriendStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 812;

    // 더미 친구 데이터
    final friends = [
      _FriendData(
        name: '김철수',
        progress: 8,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '이영희',
        progress: 7,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '박민수',
        progress: 9,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '정수진',
        progress: 6,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '최동현',
        progress: 10,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '한소영',
        progress: 5,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '윤태준',
        progress: 7,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '강미라',
        progress: 8,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
      _FriendData(
        name: '조성민',
        progress: 9,
        total: 10,
        image: 'assets/IMG_6.png',
      ),
    ];

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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20 * scaleX,
                      color: const Color(0xFF1F2024),
                    ),
                  ),
                  Text(
                    '친구 현황',
                    style: GoogleFonts.inter(
                      fontSize: 18 * scaleX,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F2024),
                    ),
                  ),
                  SizedBox(width: 20 * scaleX), // Spacer
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
                    SizedBox(height: 24 * scaleY),
                    // Header
                    Text(
                      '친구들의 챌린지 진행 상황',
                      style: GoogleFonts.inter(
                        fontSize: 20 * scaleX,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1F2024),
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 8 * scaleY),
                    Text(
                      '${friends.length}명의 친구가 챌린지에 참여하고 있어요',
                      style: GoogleFonts.inter(
                        fontSize: 14 * scaleX,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF71727A),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 24 * scaleY),
                    // Friends List
                    ...friends.map((friend) => _buildFriendItem(
                      friend,
                      scaleX,
                      scaleY,
                    )),
                    SizedBox(height: 24 * scaleY),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendItem(_FriendData friend, double scaleX, double scaleY) {
    final progressPercentage = (friend.progress / friend.total) * 100;

    return Container(
      margin: EdgeInsets.only(bottom: 16 * scaleY),
      padding: EdgeInsets.all(16 * scaleX),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(12 * scaleX),
      ),
      child: Row(
        children: [
          // Friend Image
          Container(
            width: 56 * scaleX,
            height: 56 * scaleY,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E9F1),
              borderRadius: BorderRadius.circular(28 * scaleX),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28 * scaleX),
              child: Image.asset(
                friend.image,
                width: 56 * scaleX,
                height: 56 * scaleY,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 56 * scaleX,
                    height: 56 * scaleY,
                    color: const Color(0xFF4A90E2),
                    child: Icon(
                      Icons.person,
                      size: 28 * scaleX,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 16 * scaleX),
          // Friend Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  friend.name,
                  style: GoogleFonts.inter(
                    fontSize: 16 * scaleX,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2024),
                    height: 1.25,
                  ),
                ),
                SizedBox(height: 8 * scaleY),
                // Progress Bar
                Container(
                  width: double.infinity,
                  height: 8 * scaleY,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E9F1),
                    borderRadius: BorderRadius.circular(4 * scaleX),
                  ),
                  child: Stack(
                    children: [
                      // Progress Fill
                      FractionallySizedBox(
                        widthFactor: friend.progress / friend.total,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE86339),
                            borderRadius: BorderRadius.circular(4 * scaleX),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4 * scaleY),
                // Progress Text
                Text(
                  '${friend.progress}/${friend.total} 완료 (${progressPercentage.toStringAsFixed(0)}%)',
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
        ],
      ),
    );
  }
}

class _FriendData {
  final String name;
  final int progress;
  final int total;
  final String image;

  _FriendData({
    required this.name,
    required this.progress,
    required this.total,
    required this.image,
  });
}

