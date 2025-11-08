import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'completion_screen.dart';

class AllergySelectionScreen extends StatefulWidget {
  const AllergySelectionScreen({super.key});

  @override
  State<AllergySelectionScreen> createState() => _AllergySelectionScreenState();
}

class _AllergySelectionScreenState extends State<AllergySelectionScreen> {
  final Set<String> selectedAllergies = {};

  final List<String> allergies = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Fish',
    'Shellfish',
    'Soy',
    'Wheat',
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
          // Content area
          Positioned(
            left: 24 * scaleX,
            top: (43.88 + 24) * scaleY,
            right: 24 * scaleX,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Bar (6/6 = 100%)
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
                        width: 327 * scaleX,
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
                        '어떤 알레르기가 있나요?',
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
                        'Which allergy do you have?',
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
                  // Options list
                  Column(
                    children: allergies.map((allergy) {
                      final isSelected = selectedAllergies.contains(allergy);
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8 * scaleY),
                        child: _AllergyListItem(
                          allergy: allergy,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedAllergies.remove(allergy);
                              } else {
                                selectedAllergies.add(allergy);
                              }
                            });
                          },
                          scaleX: scaleX,
                          scaleY: scaleY,
                        ),
                      );
                    }).toList(),
                  ),
                ],
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
                  // 완료 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompletionScreen(),
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
                  '완료',
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

class _AllergyListItem extends StatelessWidget {
  final String allergy;
  final bool isSelected;
  final VoidCallback onTap;
  final double scaleX;
  final double scaleY;

  const _AllergyListItem({
    required this.allergy,
    required this.isSelected,
    required this.onTap,
    required this.scaleX,
    required this.scaleY,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52 * scaleY,
        padding: EdgeInsets.all(16 * scaleX),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF4E4) : Colors.white,
          border: Border.all(
            color: const Color(0xFFC5C6CC),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12 * scaleX),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                allergy,
                style: GoogleFonts.inter(
                  fontSize: 14 * scaleX,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF1F2024),
                  height: 20 / 14,
                ),
              ),
            ),
            if (isSelected)
              Container(
                width: 12 * scaleX,
                height: 12 * scaleY,
                decoration: BoxDecoration(
                  color: const Color(0xFFE86339),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 8 * scaleX,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

