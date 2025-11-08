import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VegetarianTypeScreen extends StatefulWidget {
  const VegetarianTypeScreen({super.key});

  @override
  State<VegetarianTypeScreen> createState() => _VegetarianTypeScreenState();
}

class _VegetarianTypeScreenState extends State<VegetarianTypeScreen> {
  String? selectedOption;

  final List<String> options = [
    'Vegan',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Lacto-Ovo Vegetarian',
    'Pescatarian',
    'Flexitarian',
    'Raw Vegan',
    'Other',
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Bar (5/6 = 83.33%)
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
                        width: (327 * scaleX) * (5 / 6),
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
                        '채식의 정도를 선택하세요',
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
                        'What\'s your vegetarian type?',
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
                    children: options.map((option) {
                      final isSelected = selectedOption == option;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8 * scaleY),
                        child: _OptionListItem(
                          option: option,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedOption = option;
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
                  Navigator.pop(context);
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

class _OptionListItem extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;
  final double scaleX;
  final double scaleY;

  const _OptionListItem({
    required this.option,
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
                option,
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

