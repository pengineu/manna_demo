import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'language_selection_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Figma design size: 402 x 874
    // Scale factor for responsive design
    final scaleX = screenWidth / 402;
    final scaleY = screenHeight / 874;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // iOS Status Bar (44px height at top)
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
          // Content area (144px height at top, starting from 44px)
          Positioned(
            top: 44 * scaleY,
            left: 0,
            right: 0,
            height: 100 * scaleY,
            child: Container(
              color: Colors.transparent,
            ),
          ),
            // Center image (181x181) - positioned at x: 110, y: 255.59 (adjusted for status bar)
            Positioned(
              left: (110 * scaleX),
              top: (255.59 * scaleY),
              child: Image.asset(
                'assets/8a70aa02fde02474827466302d61215c6c9fc5fb.png',
                width: 181 * scaleX,
                height: 181 * scaleY,
                fit: BoxFit.cover,
              ),
            ),
            // Title text - positioned at x: 111, y: 428.59
            Positioned(
              left: (111 * scaleX),
              top: (428.59 * scaleY),
              child: Text(
                '맛난 한국 음식을 만나다',
                style: GoogleFonts.inter(
                  fontSize: 18 * scaleX,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: 0.09 * scaleX,
                  height: 1.0,
                ),
              ),
            ),
            // Tip text - positioned at x: 84, y: 473.59
            Positioned(
              left: (84 * scaleX),
              top: (473.59 * scaleY),
              child: Text(
                'Tip. 한국에서는 밥그릇을 들고 먹지 않습니다.',
                style: GoogleFonts.inter(
                  fontSize: 12 * scaleX,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF7C7C7C),
                  letterSpacing: 0.12 * scaleX,
                  height: 1.0,
                ),
              ),
            ),
            // Start button - positioned at x: 37, y: 801.59
            Positioned(
              left: (37 * scaleX),
              top: (801.59 * scaleY),
              child: SizedBox(
                width: 327 * scaleX,
                height: 48 * scaleY,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguageSelectionScreen(),
                      ),
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
                    '시작하기',
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

