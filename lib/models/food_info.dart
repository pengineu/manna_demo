class FoodInfo {
  final String name;
  final String nameEnglish;
  final List<String> ingredients;
  
  // 맛 정보 (0.0 ~ 1.0)
  final double tasteSweet;      // 단맛
  final double tasteSalty;      // 짠맛
  final double tasteSour;       // 신맛
  final double tasteBitter;     // 쓴맛
  final double tasteSpicy;      // 매운 정도
  final double tasteGreasy;     // 느끼한 정도
  
  // 맵기 정보 (0-5 단계)
  final int spiceLevel;         // 맵기 단계 (0: 안맵, 1: 후추, 2: 할라피뇨, 3: 신라면, 4: 불닭, 5: 최고)
  
  // 할랄/비건 정보
  final bool isHalal;
  final String? vegetarianType; // null, 'vegan', 'lacto', 'ovo', 'lacto-ovo', 'pesco', 'flexitarian', 'fruitarian'
  
  final String description;     // 음식 소개
  final double matchLevel;     // 음식 매칭 정도 (0.0-1.0)
  final String texture;         // 식감 특성
  final List<String> similarKoreanFoods;  // 우리나라 음식과 비슷한 음식
  final List<String> similarTasteFoods;   // 유사 맛 음식
  final List<String> tags;      // 태그들 (비슷한 음식)
  
  // 리뷰 정보
  final int reviewCount;
  final double averageRating;
  final String? sampleReview;  // 샘플 리뷰

  FoodInfo({
    required this.name,
    required this.nameEnglish,
    required this.ingredients,
    required this.tasteSweet,
    required this.tasteSalty,
    required this.tasteSour,
    required this.tasteBitter,
    required this.tasteSpicy,
    required this.tasteGreasy,
    required this.spiceLevel,
    this.isHalal = false,
    this.vegetarianType,
    required this.description,
    required this.matchLevel,
    required this.texture,
    required this.similarKoreanFoods,
    required this.similarTasteFoods,
    required this.tags,
    this.reviewCount = 0,
    this.averageRating = 0.0,
    this.sampleReview,
  });

  // 더미 데이터 생성 팩토리
  factory FoodInfo.dummy() {
    return FoodInfo(
      name: '잔치국수',
      nameEnglish: 'janchi-guksu',
      ingredients: ['멸치육수', '당근', '양파', '김치'],
      tasteSweet: 0.2,
      tasteSalty: 0.7,
      tasteSour: 0.6,
      tasteBitter: 0.1,
      tasteSpicy: 0.0,
      tasteGreasy: 0.1,
      spiceLevel: 0,
      isHalal: false,
      vegetarianType: null,
      description: '잔치국수는 멸치나 다시마로 만든 육수에 얇은 국수를 넣은 한국의 전통 국수 요리입니다. 잔치나 명절에 자주 먹는 음식으로, 깔끔하고 따뜻한 맛이 특징입니다. 김가루와 지단을 올려서 풍미를 더합니다.',
      matchLevel: 0.85,
      texture: '따듯함, 부드러움, 탱글함, 밀도감 등',
      similarKoreanFoods: ['칼국수', '수제비', '국밥', '온면'],
      similarTasteFoods: ['떡국'],
      tags: ['봉지라면', '사골곰탕', '불국수', '분탕', '김치국수'],
      reviewCount: 5,
      averageRating: 4.0,
      sampleReview: '국물이 정말 따뜻하고 맛있어요. 너무 뜨거워서 살짝 식혔다 먹는 것이 좋을 것 같아요.',
    );
  }
}

