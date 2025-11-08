import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'camera_screen.dart';
import 'loading_screen.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceScreen extends StatelessWidget {
  final String scanType; // 'food' 또는 'menu'

  const ImageSourceScreen({
    super.key,
    required this.scanType,
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
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: 24 * scaleX,
            vertical: 24 * scaleY,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                scanType == 'food' ? '음식/상품 사진' : '메뉴판',
                style: GoogleFonts.inter(
                  fontSize: 24 * scaleX,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F2024),
                ),
              ),
              SizedBox(height: 48 * scaleY),
              // 카메라로 촬영
              SizedBox(
                width: double.infinity,
                height: 56 * scaleY,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(scanType: scanType),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE86339),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * scaleX),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '카메라로 촬영',
                    style: GoogleFonts.inter(
                      fontSize: 16 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12 * scaleY),
              // 갤러리에서 선택
              SizedBox(
                width: double.infinity,
                height: 56 * scaleY,
                child: ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    
                    if (image != null && context.mounted) {
                      // TODO: 로딩 화면 → 결과 화면으로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingScreen(
                            imagePath: image.path,
                            scanType: scanType,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE86339),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * scaleX),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '갤러리에서 선택',
                    style: GoogleFonts.inter(
                      fontSize: 16 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12 * scaleY),
              // 취소
              SizedBox(
                width: double.infinity,
                height: 56 * scaleY,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF71727A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * scaleX),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '취소',
                    style: GoogleFonts.inter(
                      fontSize: 16 * scaleX,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

