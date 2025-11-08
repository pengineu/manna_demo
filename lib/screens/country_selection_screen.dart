import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_screen.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;

  final List<String> countries = [
    'South Korea',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'China',
    'Vietnam',
    'Thailand',
    'Singapore',
    'India',
    'Brazil',
    'Mexico',
    'Spain',
    'Italy',
    'Netherlands',
    'Sweden',
    'Norway',
  ];

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
          // Content area
          Positioned(
            left: 24 * scaleX,
            top: (43.88 + 24) * scaleY,
            right: 24 * scaleX,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar (2/6 = 33.33%)
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8 * scaleY,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E9F1),
                        borderRadius: BorderRadius.circular(4 * scaleX),
                      ),
                    ),
                    Container(
                      width: (327 * scaleX) * (2 / 6),
                      height: 8 * scaleY,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE86339),
                        borderRadius: BorderRadius.circular(4 * scaleX),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 41 * scaleY),
                // Title section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '국적을 선택하세요',
                      style: GoogleFonts.inter(
                        fontSize: 24 * scaleX,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F2024),
                        letterSpacing: 0.24 * scaleX,
                        height: 1.0,
                      ),
                    ),
                    SizedBox(height: 16 * scaleY),
                    Text(
                      'Enter your nationality.',
                      style: GoogleFonts.inter(
                        fontSize: 14 * scaleX,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF71727A),
                        height: 20 / 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16 * scaleY),
                // Dropdown
                Container(
                  width: double.infinity,
                  height: 71 * scaleY,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFC5C6CC),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12 * scaleX),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedCountry,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scaleX,
                        vertical: 12 * scaleY,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    hint: Text(
                      'Select your country',
                      style: GoogleFonts.inter(
                        fontSize: 14 * scaleX,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF71727A),
                      ),
                    ),
                    style: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF1F2024),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: const Color(0xFF1F2024),
                      size: 24 * scaleX,
                    ),
                    items: countries.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue;
                      });
                    },
                  ),
                ),
              ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionScreen(),
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
                  '다음으로',
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

