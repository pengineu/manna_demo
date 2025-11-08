import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_result_screen.dart';
import 'menu_result_screen.dart';
import '../models/food_info.dart';
import '../models/menu_info.dart';
import '../models/menu_item.dart';

class LoadingScreen extends StatefulWidget {
  final String imagePath;
  final String scanType; // 'food' 또는 'menu'

  const LoadingScreen({
    super.key,
    required this.imagePath,
    required this.scanType,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후 결과 화면으로 이동 (더미 데이터)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (widget.scanType == 'food') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FoodResultScreen(
                imagePath: widget.imagePath,
                foodInfo: FoodInfo.dummy(),
              ),
            ),
          );
        } else {
          // 메뉴판 결과 화면으로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MenuResultScreen(
                menuImagePath: widget.imagePath,
                menuInfo: MenuInfo.dummy(),
                menuItems: [
                  MenuItem.dummy(0),
                  MenuItem.dummy(1),
                  MenuItem.dummy(2),
                ],
              ),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 812;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color(0xFFE86339),
                ),
              ),
              SizedBox(height: 24 * scaleY),
              Text(
                '이미지를 분석하고 있습니다...',
                style: GoogleFonts.inter(
                  fontSize: 16 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF71727A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

