import 'menu_item.dart';

class MenuInfo {
  final String name;
  final String? imagePath;      // 메뉴판 사진 경로
  final String description;     // 메뉴판 정보
  final List<MenuItem> items;   // 메뉴 항목들

  MenuInfo({
    required this.name,
    this.imagePath,
    required this.description,
    required this.items,
  });

  // 더미 데이터 생성 팩토리
  factory MenuInfo.dummy() {
    return MenuInfo(
      name: '안주킹 대전역점',
      description: '한국식 안주 전문점 한국의 맛을 느낄 수 있는 정통적인 식당 추천메뉴 : 두부김치',
      items: [],
    );
  }
}

