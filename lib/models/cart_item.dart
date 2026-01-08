class CartItem {
  final String id;
  final String name;
  final String price;
  final String originalPrice;
  final String image;
  int quantity;
  bool isSelected;
  bool isPromo;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice = '',
    required this.image,
    this.quantity = 1,
    this.isSelected = true,
    this.isPromo = false,
  });

  // Convert to map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'originalPrice': originalPrice,
      'image': image,
      'quantity': quantity,
      'isSelected': isSelected,
      'isPromo': isPromo,
    };
  }

  // Create from map
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      originalPrice: map['originalPrice'] ?? '',
      image: map['image'],
      quantity: map['quantity'] ?? 1,
      isSelected: map['isSelected'] ?? true,
      isPromo: map['isPromo'] ?? false,
    );
  }

  // Calculate subtotal
  double get subtotal {
    // Remove 'Rp.' and dots, then convert to double
    final priceString = price.replaceAll('Rp. ', '').replaceAll('.', '');
    final priceValue = double.tryParse(priceString) ?? 0;
    return priceValue * quantity;
  }
}