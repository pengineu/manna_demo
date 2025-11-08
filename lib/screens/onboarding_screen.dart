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
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Center image (181x181) - positioned at x: 110, y: 255.59 (adjusted for status bar)
            Positioned(
              left: (110 * scaleX),
              top: (255.59 * scaleY),
              child: Image.asset(
                'assets/8a70aa02fde02474827466302d61215c6c9fc5fb.png',
                width: 181 * scaleX,
                height: 181 * scaleY,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 181 * scaleX,
                    height: 181 * scaleY,
                    color: const Color(0xFFE8E9F1),
                    child: Icon(
                      Icons.image,
                      size: 50 * scaleX,
                      color: const Color(0xFFC5C6CC),
                    ),
                  );
                },
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
              bottom: 24 * scaleY + MediaQuery.of(context).padding.bottom,
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
      ),
    );
  }
}

