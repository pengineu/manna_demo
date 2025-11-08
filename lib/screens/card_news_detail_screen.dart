import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNewsDetailScreen extends StatelessWidget {
  final String image;
  final String subtitle;
  final String title;
  final String content;

  const CardNewsDetailScreen({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.content,
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
                    '카드 뉴스',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      width: double.infinity,
                      height: 240 * scaleY,
                      child: Image.asset(
                        image,
                        width: double.infinity,
                        height: 240 * scaleY,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 240 * scaleY,
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
                    // Content Section
                    Padding(
                      padding: EdgeInsets.all(24 * scaleX),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Subtitle
                          Text(
                            subtitle,
                            style: GoogleFonts.inter(
                              fontSize: 14 * scaleX,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF71727A),
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 8 * scaleY),
                          // Title
                          Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 24 * scaleX,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F2024),
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 24 * scaleY),
                          // Divider
                          Container(
                            height: 1,
                            color: const Color(0xFFE8E9F1),
                          ),
                          SizedBox(height: 24 * scaleY),
                          // Content
                          Text(
                            content,
                            style: GoogleFonts.inter(
                              fontSize: 16 * scaleX,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF1F2024),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
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

