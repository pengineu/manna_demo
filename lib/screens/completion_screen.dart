import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Figma design size: 402 x 874
    final scaleX = screenWidth / 402;
    final scaleY = screenHeight / 874;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Character image area - centered
          Positioned(
            left: 0,
            right: 0,
            top: 272 * scaleY,
            child: Center(
              child: Image.asset(
                'assets/IMG_6.png',
                width: 274 * scaleX,
                height: 204 * scaleY,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 274 * scaleX,
                    height: 204 * scaleY,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8E9F1),
                      borderRadius: BorderRadius.circular(12 * scaleX),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_circle,
                        size: 120 * scaleX,
                        color: const Color(0xFFE86339),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Title text - "설정 완료!"
          Positioned(
            left: 0,
            right: 0,
            top: 490 * scaleY,
            child: Center(
              child: Text(
                '설정 완료!',
                style: GoogleFonts.inter(
                  fontSize: 20 * scaleX,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2024),
                  letterSpacing: 0,
                  height: 1.0,
                ),
              ),
            ),
          ),
          // Description text
          Positioned(
            left: 24 * scaleX,
            right: 24 * scaleX,
            top: 536 * scaleY,
            child: Text(
              '정보 설정이 끝났어요! 이제 메인 화면을 둘러볼까요?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14 * scaleX,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF71727A),
                height: 1.4,
              ),
            ),
          ),
          // Bottom button
          Positioned(
            left: 24 * scaleX,
            bottom: 24 * scaleY,
            right: 24 * scaleX,
            child: SizedBox(
              width: 354 * scaleX,
              height: 48 * scaleY,
              child: ElevatedButton(
                onPressed: () {
                  // 메인 화면으로 이동 (모든 이전 화면 제거)
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * scaleX,
                    vertical: 12 * scaleY,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  '메인 화면으로',
                  style: GoogleFonts.inter(
                    fontSize: 12 * scaleX,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

