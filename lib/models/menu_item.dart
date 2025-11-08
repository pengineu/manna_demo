import 'food_info.dart';

class MenuItem {
  final String name;
  final String? imagePath;
  final int spiceLevel; // 맵기 단계 (0-5)
  final String price;
  final String? details; // 상세 정보
  final FoodInfo? foodInfo; // 음식 정보 (클릭 시 표시)

  MenuItem({
    required this.name,
    this.imagePath,
    required this.spiceLevel,
    required this.price,
    this.details,
    this.foodInfo,
  });

  // 더미 데이터 생성 팩토리
  factory MenuItem.dummy(int index) {
    final names = ['두부김치', '닭도리탕', '불고기'];
    final spiceLevels = [0, 3, 1];
    final prices = ['8000원', '12000원', '15000원'];
    
    return MenuItem(
      name: names[index % names.length],
      spiceLevel: spiceLevels[index % spiceLevels.length],
      price: prices[index % prices.length],
      details: '한국 전통 안주',
    );
  }
}

