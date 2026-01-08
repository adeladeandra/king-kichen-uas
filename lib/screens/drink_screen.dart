import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_routes.dart';
import '../widgets/category_tabs.dart';
import '../services/cart_service.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _drinks = [
    {
      'name': 'Coca-Cola',
      'price': 'Rp. 12.000',
      'image': 'assets/images/images_drink/151b56743be10822617240517a5287b381173fe5.png',
    },
    {
      'name': 'Sprite',
      'price': 'Rp. 12.000',
      'image': 'assets/images/images_drink/66664e5c98b9b4d9e57e083e3d6327f51ecd3828.png',
    },
    {
      'name': 'Frestea',
      'price': 'Rp. 10.000',
      'image': 'assets/images/images_drink/84686f756b22e8c10b9abd65a9834e26b3a9321a.png',
    },
    {
      'name': 'Orange Juice',
      'price': 'Rp. 15.000',
      'image': 'assets/images/images_drink/8a0f2766d87d6df2a35c93915282620af4516db4.png',
    },
    {
      'name': 'Lemon Tea',
      'price': 'Rp. 13.000',
      'image': 'assets/images/images_drink/a01a359fcecd6d819dfd05e5c2cb1a07b1d9722c.png',
    },
    {
      'name': 'Coffee',
      'price': 'Rp. 18.000',
      'image': 'assets/images/images_drink/c9b475f86378212b644c45e7a08cb34b35a9880d.png',
    },
    {
      'name': 'Milkshake',
      'price': 'Rp. 20.000',
      'image': 'assets/images/images_drink/d50f7863da13f524c144abe7f2844d750d12de54.png',
    },
    {
      'name': 'Mineral Water',
      'price': 'Rp. 8.000',
      'image': 'assets/images/images_drink/ec4e68854c8742fb1744bf2b12564c01b30321a4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryOrange,
              AppColors.lightOrange,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation Bar
              _buildTopNavigationBar(),
              const SizedBox(height: 16),
              
              // Category Tabs
              CategoryTabs(
                selectedIndex: _selectedCategory,
                currentScreen: 'drink',
                onCategorySelected: (index) {
                  setState(() {
                    _selectedCategory = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              
              // Drink Grid
              Expanded(
                child: _buildDrinkGrid(),
              ),
              const SizedBox(height: 20), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const Text(
                'MINUMAN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.cart);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrinkGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7, // Further increased aspect ratio for more height
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        itemCount: _drinks.length,
        itemBuilder: (context, index) {
          final drink = _drinks[index];
          return _buildDrinkCard(drink);
        },
      ),
    );
  }

  Widget _buildDrinkCard(Map<String, dynamic> drink) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: AppColors.lightGrey,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  drink['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey,
                      child: const Center(
                        child: Icon(
                          Icons.local_drink,
                          color: AppColors.grey,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      drink['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        drink['price'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final cartService = Provider.of<CartService>(context, listen: false);
                          cartService.addItem(
                            id: drink['name'].replaceAll(' ', '_').toLowerCase(),
                            name: drink['name'],
                            price: drink['price'],
                            image: drink['image'],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Ditambahkan ke keranjang'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primaryOrange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}