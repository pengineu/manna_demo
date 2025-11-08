import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loading_screen.dart';

class CameraScreen extends StatefulWidget {
  final String scanType; // 'food' 또는 'menu'

  const CameraScreen({
    super.key,
    required this.scanType,
  });

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  double currentZoom = 1.0;
  bool isFlashOn = false;
  bool isMuted = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Figma design size: 375 x 812 (iPhone 기준)
    final scaleX = screenWidth / 375;
    final scaleY = screenHeight / 812;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview Area (실제 카메라는 나중에 구현)
          Container(
            width: screenWidth,
            height: screenHeight,
            color: const Color(0xFF1F2024), // 카메라 프리뷰 배경
            child: Stack(
              children: [
                // Grid Lines (3x3)
                CustomPaint(
                  size: Size(screenWidth, screenHeight),
                  painter: _GridPainter(),
                ),
                // Camera Preview Placeholder
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 80 * scaleX,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(height: 16 * scaleY),
                      Text(
                        '카메라 프리뷰',
                        style: GoogleFonts.inter(
                          fontSize: 16 * scaleX,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * scaleX,
                  vertical: 12 * scaleY,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side - Flash and Night Mode
                    Row(
                      children: [
                        // Flash Icon
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFlashOn = !isFlashOn;
                            });
                          },
                          child: Container(
                            width: 40 * scaleX,
                            height: 40 * scaleY,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFlashOn ? Icons.flash_on : Icons.flash_off,
                              size: 24 * scaleX,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12 * scaleX),
                        // Night Mode Icon
                        Container(
                          width: 40 * scaleX,
                          height: 40 * scaleY,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.nightlight_round,
                            size: 24 * scaleX,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // Center - Dynamic Island (Camera Indicator)
                    Container(
                      width: 126 * scaleX,
                      height: 37 * scaleY,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20 * scaleX),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20 * scaleX,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                width: 8 * scaleX,
                                height: 8 * scaleY,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20 * scaleX,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Icon(
                                Icons.arrow_upward,
                                size: 16 * scaleX,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right side - Mute Icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMuted = !isMuted;
                        });
                      },
                      child: Container(
                        width: 40 * scaleX,
                        height: 40 * scaleY,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isMuted ? Icons.volume_off : Icons.volume_up,
                          size: 24 * scaleX,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Zoom Controls
          Positioned(
            bottom: 140 * scaleY,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildZoomButton('0.5', 0.5, scaleX, scaleY),
                  SizedBox(width: 12 * scaleX),
                  _buildZoomButton('1x', 1.0, scaleX, scaleY),
                  SizedBox(width: 12 * scaleX),
                  _buildZoomButton('2', 2.0, scaleX, scaleY),
                  SizedBox(width: 12 * scaleX),
                  _buildZoomButton('3', 3.0, scaleX, scaleY),
                ],
              ),
            ),
          ),
          // Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24 * scaleX,
                  vertical: 24 * scaleY,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left spacer
                    SizedBox(width: 60 * scaleX),
                    // Shutter Button
                    GestureDetector(
                      onTap: () {
                        // TODO: 사진 촬영 기능 구현
                        _takePicture();
                      },
                      child: Container(
                        width: 72 * scaleX,
                        height: 72 * scaleY,
                        decoration: BoxDecoration(
                          color: const Color(0xFF71727A),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4 * scaleX,
                          ),
                        ),
                      ),
                    ),
                    // Camera Switch Button
                    GestureDetector(
                      onTap: () {
                        // TODO: 전면/후면 카메라 전환 기능 구현
                      },
                      child: Container(
                        width: 48 * scaleX,
                        height: 48 * scaleY,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cameraswitch,
                          size: 24 * scaleX,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomButton(String label, double zoom, double scaleX, double scaleY) {
    final isSelected = currentZoom == zoom;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentZoom = zoom;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12 * scaleX,
          vertical: 6 * scaleY,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.3)
              : Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20 * scaleX),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14 * scaleX,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _takePicture() {
    // TODO: 실제 사진 촬영 기능 구현
    // 더미 이미지 경로 생성 (실제로는 촬영한 이미지 경로)
    final dummyImagePath = 'assets/placeholder.jpg';
    
    // 로딩 화면으로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(
          imagePath: dummyImagePath,
          scanType: widget.scanType,
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Vertical lines
    canvas.drawLine(
      Offset(size.width / 3, 0),
      Offset(size.width / 3, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 2 / 3, 0),
      Offset(size.width * 2 / 3, size.height),
      paint,
    );

    // Horizontal lines
    canvas.drawLine(
      Offset(0, size.height / 3),
      Offset(size.width, size.height / 3),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height * 2 / 3),
      Offset(size.width, size.height * 2 / 3),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

