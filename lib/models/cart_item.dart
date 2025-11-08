import 'menu_item.dart';

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
  });

  int get totalPrice {
    // 가격에서 숫자만 추출 (예: "10,000원" -> 10000)
    final priceStr = menuItem.price.replaceAll(RegExp(r'[^0-9]'), '');
    final price = int.tryParse(priceStr) ?? 0;
    return price * quantity;
  }

  String get formattedTotalPrice {
    return '${totalPrice.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}원';
  }
}

