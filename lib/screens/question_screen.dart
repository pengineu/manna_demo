import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vegetarian_type_screen.dart';
import 'allergy_selection_screen.dart';
import 'religious_reason_screen.dart';
import 'completion_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Set<String> selectedOptions = {};
  bool isNoneSelected = false;

  final List<Map<String, String>> options = [
    {'id': 'vegetarian', 'name': '채식주의자'},
    {'id': 'allergy', 'name': '알레르기를 가지고 있음'},
    {'id': 'religious', 'name': '종교적 이유로 못먹는 음식이 있음'},
    {'id': 'none', 'name': '선택사항 없음'},
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
                // Progress Bar (3/6 = 50%)
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
                      width: (327 * scaleX) * (3 / 6),
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
                      '어떤 사항에 해당하나요?',
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
                      'Which one fits to you? Choose freely.',
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
                    final optionId = option['id']!;
                    final isSelected = optionId == 'none'
                        ? isNoneSelected
                        : selectedOptions.contains(optionId);
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8 * scaleY),
                      child: _OptionListItem(
                        option: option['name']!,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            if (optionId == 'none') {
                              // "선택사항 없음" 선택 시 다른 선택 모두 해제
                              isNoneSelected = !isNoneSelected;
                              if (isNoneSelected) {
                                selectedOptions.clear();
                              }
                            } else {
                              // 다른 옵션 선택 시 "선택사항 없음" 해제
                              if (isNoneSelected) {
                                isNoneSelected = false;
                              }
                              // 복수 선택 토글
                              if (selectedOptions.contains(optionId)) {
                                selectedOptions.remove(optionId);
                              } else {
                                selectedOptions.add(optionId);
                              }
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
          // Bottom button
          Positioned(
            left: 24 * scaleX,
            bottom: 24 * scaleY,
            right: 24 * scaleX,
            child: SizedBox(
              width: 354 * scaleX,
              height: 48 * scaleY,
              child: ElevatedButton(
                onPressed: (selectedOptions.isEmpty && !isNoneSelected)
                    ? null
                    : () {
                        // "선택사항 없음" 선택 시 완료 화면으로 바로 이동
                        if (isNoneSelected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompletionScreen(),
                            ),
                          );
                          return;
                        }

                        // 선택된 항목들을 순차적으로 처리 (순서: 채식주의자 -> 알레르기 -> 종교적 이유)
                        final orderedOptions = _orderOptions(selectedOptions.toList());
                        _navigateToNextScreen(context, orderedOptions, 0);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (selectedOptions.isEmpty && !isNoneSelected)
                      ? const Color(0xFFC5C6CC)
                      : const Color(0xFFE86339),
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

  // 옵션을 순서대로 정렬 (채식주의자 -> 알레르기 -> 종교적 이유)
  List<String> _orderOptions(List<String> options) {
    final order = ['vegetarian', 'allergy', 'religious'];
    final ordered = <String>[];
    for (final id in order) {
      if (options.contains(id)) {
        ordered.add(id);
      }
    }
    return ordered;
  }

  void _navigateToNextScreen(BuildContext context, List<String> options, int index) {
    if (index >= options.length) {
      // 모든 선택 처리 완료 -> 완료 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CompletionScreen(),
        ),
      );
      return;
    }

    final optionId = options[index];
    Widget nextScreen;

    if (optionId == 'vegetarian') {
      nextScreen = const VegetarianTypeScreen();
    } else if (optionId == 'allergy') {
      nextScreen = const AllergySelectionScreen();
    } else if (optionId == 'religious') {
      nextScreen = const ReligiousReasonScreen();
    } else {
      // 알 수 없는 옵션은 건너뛰기
      _navigateToNextScreen(context, options, index + 1);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    ).then((_) {
      // 다음 화면에서 돌아오면 다음 선택 처리
      _navigateToNextScreen(context, options, index + 1);
    });
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

