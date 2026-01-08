import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_routes.dart';

class CategoryTabs extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;
  final bool isHorizontalLayout;
  final bool useNavigation;
  final String? currentScreen;

  const CategoryTabs({
    super.key,
    this.selectedIndex = 0,
    required this.onCategorySelected,
    this.isHorizontalLayout = true,
    this.useNavigation = true,
    this.currentScreen,
  });

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  late int _selectedCategory;

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Paket Combo', 'icon': 'assets/images/images_category/category_paket.png'},
    {'name': 'Burgers', 'icon': 'assets/images/images_category/category_burger.png'},
    {'name': 'Drink', 'icon': 'assets/images/images_category/category_drink.png'},
    {'name': 'Chicken', 'icon': 'assets/images/images_category/category_chicken.png'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isHorizontalLayout) {
      return _buildHorizontalLayout();
    } else {
      return _buildVerticalLayout();
    }
  }

  Widget _buildHorizontalLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == _selectedCategory;
          final isCurrentScreenCategory = _isCurrentScreenCategory(category['name']);
          
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = index;
                  });
                  widget.onCategorySelected(index);
                  
                  if (widget.useNavigation) {
                    _handleNavigation(category['name']);
                  }
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isCurrentScreenCategory ? AppColors.primaryOrange : AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: isCurrentScreenCategory ? Border.all(
                      color: AppColors.white,
                      width: 2,
                    ) : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                      if (isCurrentScreenCategory)
                        BoxShadow(
                          color: AppColors.primaryOrange.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      category['icon'],
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.fastfood,
                          color: isCurrentScreenCategory ? AppColors.white : AppColors.primaryOrange,
                          size: 30,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category['name'],
                style: TextStyle(
                  color: isCurrentScreenCategory ? AppColors.white : AppColors.white,
                  fontSize: 12,
                  fontWeight: isCurrentScreenCategory ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: _categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == _selectedCategory;
          
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = index;
                });
                widget.onCategorySelected(index);
                
                if (widget.useNavigation) {
                  _handleNavigation(category['name']);
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryOrange : AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.white,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      category['icon'],
                      width: 30,
                      height: 30,
                      color: isSelected ? AppColors.white : AppColors.primaryOrange,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.fastfood,
                          color: isSelected ? AppColors.white : AppColors.primaryOrange,
                          size: 30,
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category['name'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? AppColors.white : AppColors.darkGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  bool _isCurrentScreenCategory(String categoryName) {
    if (widget.currentScreen == null) return false;
    
    switch (widget.currentScreen) {
      case 'package':
        return categoryName == 'Paket Combo' || categoryName == 'Paket';
      case 'burger':
        return categoryName == 'Burgers';
      case 'drink':
        return categoryName == 'Drink';
      case 'chicken':
        return categoryName == 'Chicken';
      default:
        return false;
    }
  }

  void _handleNavigation(String categoryName) {
    if (categoryName == 'Paket Combo' || categoryName == 'Paket') {
      Navigator.pushNamed(context, AppRoutes.packages);
    } else if (categoryName == 'Drink') {
      Navigator.pushNamed(context, AppRoutes.drinks);
    } else if (categoryName == 'Burgers' || categoryName == 'Chicken') {
      _showUnavailablePopup(categoryName);
    }
  }

  void _showUnavailablePopup(String categoryName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Produk Tidak Tersedia',
            style: TextStyle(
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Maaf, produk $categoryName tidak tersedia saat ini.',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}