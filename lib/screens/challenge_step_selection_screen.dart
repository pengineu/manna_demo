import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeStepSelectionScreen extends StatefulWidget {
  final String challengeName;
  final List<int> currentSteps;

  const ChallengeStepSelectionScreen({
    super.key,
    required this.challengeName,
    this.currentSteps = const [],
  });

  @override
  State<ChallengeStepSelectionScreen> createState() => _ChallengeStepSelectionScreenState();
}

class _ChallengeStepSelectionScreenState extends State<ChallengeStepSelectionScreen> {
  List<int> _selectedSteps = [];

  @override
  void initState() {
    super.initState();
    _selectedSteps = List.from(widget.currentSteps);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 812;

    // 더미 데이터 - 실제로는 API나 데이터베이스에서 가져와야 함
    final steps = [
      {
        'name': '튀김 우동',
        'description': '1단계',
        'image': 'assets/placeholder.jpg',
      },
      {
        'name': '진라면(순한 맛)',
        'description': '2단계',
        'image': 'assets/placeholder.jpg',
      },
      {
        'name': '김치볶음밥',
        'description': '3단계',
        'image': 'assets/placeholder.jpg',
      },
      {
        'name': '제육볶음',
        'description': '4단계',
        'image': 'assets/placeholder.jpg',
      },
      {
        'name': '순두부찌개',
        'description': '5단계',
        'image': 'assets/placeholder.jpg',
      },
      {
        'name': '떡볶이',
        'description': '6단계',
        'image': 'assets/placeholder.jpg',
      },
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
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context, _selectedSteps),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20 * scaleX,
                      color: const Color(0xFFE86339),
                    ),
                  ),
                  // Title
                  Text(
                    widget.challengeName,
                    style: GoogleFonts.inter(
                      fontSize: 18 * scaleX,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F2024),
                    ),
                  ),
                  // Camera icon
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 24 * scaleX,
                    color: const Color(0xFF1F2024),
                  ),
                ],
              ),
            ),
            // Header Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15 * scaleX),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8 * scaleY),
                  Text(
                    widget.challengeName,
                    style: GoogleFonts.inter(
                      fontSize: 18 * scaleX,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F2024),
                      height: 1.22,
                    ),
                  ),
                  SizedBox(height: 8 * scaleY),
                  Text(
                    '한국의 매운맛에 적응해보세요',
                    style: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF71727A),
                      height: 1.14,
                    ),
                  ),
                  SizedBox(height: 16 * scaleY),
                  // Category Tags
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryTag('ALL', true, scaleX, scaleY),
                        SizedBox(width: 8 * scaleX),
                        _buildCategoryTag('SPICY', false, scaleX, scaleY),
                        SizedBox(width: 8 * scaleX),
                        _buildCategoryTag('SEASONAL', false, scaleX, scaleY),
                        SizedBox(width: 8 * scaleX),
                        _buildCategoryTag('MEDIA', false, scaleX, scaleY),
                        SizedBox(width: 8 * scaleX),
                        _buildCategoryTag('COOKING', false, scaleX, scaleY),
                        SizedBox(width: 8 * scaleX),
                        _buildCategoryTag('PLACE', false, scaleX, scaleY),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16 * scaleY),
            // Steps List
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 23 * scaleX),
                child: Column(
                  children: steps.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;
                    final stepNumber = index + 1;
                    final isSelected = _selectedSteps.contains(stepNumber);
                    
                    return _buildStepOption(
                      stepNumber: stepNumber,
                      name: step['name']!,
                      description: step['description']!,
                      imagePath: step['image']!,
                      isSelected: isSelected,
                      scaleX: scaleX,
                      scaleY: scaleY,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String label, bool isSelected, double scaleX, double scaleY) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * scaleX,
        vertical: 8 * scaleY,
      ),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE86339) : const Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(12 * scaleX),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12 * scaleX,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : const Color(0xFFE86339),
        ),
      ),
    );
  }

  Widget _buildStepOption({
    required int stepNumber,
    required String name,
    required String description,
    required String imagePath,
    required bool isSelected,
    required double scaleX,
    required double scaleY,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedSteps.contains(stepNumber)) {
            // 이미 선택된 경우 선택 해제
            _selectedSteps.remove(stepNumber);
          } else {
            // 선택되지 않은 경우 선택 추가
            _selectedSteps.add(stepNumber);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12 * scaleY),
        padding: EdgeInsets.all(16 * scaleX),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF4E6) : Colors.white,
          borderRadius: BorderRadius.circular(12 * scaleX),
          border: Border.all(
            color: isSelected ? const Color(0xFFE86339) : const Color(0xFFE8E9F1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Image
            Container(
              width: 52 * scaleX,
              height: 52 * scaleY,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E9F1),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 52 * scaleX,
                  height: 52 * scaleY,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.restaurant,
                      size: 28 * scaleX,
                      color: const Color(0xFFC5C6CC),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 12 * scaleX),
            // Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 14 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2024),
                      height: 1.21,
                    ),
                  ),
                  SizedBox(height: 4 * scaleY),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 12 * scaleX,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF71727A),
                      height: 1.17,
                    ),
                  ),
                ],
              ),
            ),
            // Checkbox (복수 선택 가능)
            Container(
              width: 20 * scaleX,
              height: 20 * scaleY,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFE86339) : const Color(0xFFC5C6CC),
                  width: 2,
                ),
                color: isSelected ? const Color(0xFFE86339) : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 14 * scaleX,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

