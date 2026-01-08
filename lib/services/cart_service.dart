import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  // Get selected items only
  List<CartItem> get selectedItems => _items.where((item) => item.isSelected).toList();

  // Calculate total price
  double get totalPrice {
    double total = 0;
    for (var item in selectedItems) {
      // Remove 'Rp.' and dots, then convert to double
      final priceString = item.price.replaceAll('Rp. ', '').replaceAll('.', '');
      final priceValue = double.tryParse(priceString) ?? 0;
      total += priceValue * item.quantity;
    }
    return total;
  }

  // Calculate total savings
  double get totalSavings {
    double savings = 0;
    for (var item in selectedItems) {
      if (item.isPromo && item.originalPrice.isNotEmpty) {
        // Remove 'Rp.' and dots, then convert to double
        final priceString = item.price.replaceAll('Rp. ', '').replaceAll('.', '');
        final originalPriceString = item.originalPrice.replaceAll('Rp. ', '').replaceAll('.', '');
        final priceValue = double.tryParse(priceString) ?? 0;
        final originalPriceValue = double.tryParse(originalPriceString) ?? 0;
        savings += (originalPriceValue - priceValue) * item.quantity;
      }
    }
    return savings;
  }

  // Get total promo items
  int get totalPromoItems {
    return selectedItems.where((item) => item.isPromo).length;
  }

  // Get total quantity
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  // Add item to cart
  void addItem({
    required String id,
    required String name,
    required String price,
    String originalPrice = '',
    required String image,
    int quantity = 1,
    bool isPromo = false,
  }) {
    // Check if item already exists
    final existingIndex = _items.indexWhere((item) => item.id == id);
    
    if (existingIndex != -1) {
      // Update quantity if item exists
      _items[existingIndex].quantity += quantity;
    } else {
      // Add new item
      _items.add(CartItem(
        id: id,
        name: name,
        price: price,
        originalPrice: originalPrice,
        image: image,
        quantity: quantity,
        isPromo: isPromo,
      ));
    }
    
    notifyListeners();
  }

  // Remove item from cart
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // Update item quantity
  void updateQuantity(String id, int quantity) {
    if (quantity <= 0) {
      removeItem(id);
      return;
    }

    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  // Toggle item selection
  void toggleSelection(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].isSelected = !_items[index].isSelected;
      notifyListeners();
    }
  }

  // Select all items
  void selectAll() {
    for (var item in _items) {
      item.isSelected = true;
    }
    notifyListeners();
  }

  // Deselect all items
  void deselectAll() {
    for (var item in _items) {
      item.isSelected = false;
    }
    notifyListeners();
  }

  // Clear cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Get item count
  int getItemCount() {
    return _items.length;
  }

  // Format price
  String formatPrice(double price) {
    return 'Rp. ${price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }
}