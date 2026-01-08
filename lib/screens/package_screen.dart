import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_routes.dart';
import '../widgets/category_tabs.dart';
import '../services/cart_service.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _packages = [
    {
      'name': 'Paket KING BOX',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/f26d1c8b8023a3276d621724068b60104cfc0a37.png',
    },
    {
      'name': 'Ayam Spicy + Nasi',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/427a7e0efca5b768e093574730b8b8b21fc21833.png',
    },
    {
      'name': 'Ayam+Nasi + Frestea',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/468438626d6a1159d4202a07a2dc95177595230b.png',
    },
    {
      'name': '2 Ayam + Nasi + minum',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/7f51d8b63d6042223ce823e7113bbbe40d080be2.png',
    },
    {
      'name': 'Burger Crispy + Kentang+minum',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/91e52786d145d22b519e7a8088016321afcc2372.png',
    },
    {
      'name': 'Kentang jr',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/b3b6c2502c12952321297d45466238aedda2b286.png',
    },
    {
      'name': 'Cheese Whopper® Jr',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/c96b51d87ef386c4f246f9372c0a1e0a91626690.png',
    },
    {
      'name': 'Cheese Whopper® Jr',
      'price': 'Rp. 17.090',
      'image': 'assets/images/images_food_paket/280333a9f3cc2c8b990018108eb4c1415f2e3e86.png',
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
                currentScreen: 'package',
                onCategorySelected: (index) {
                  setState(() {
                    _selectedCategory = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              
              // Package Grid
              Expanded(
                child: _buildPackageGrid(),
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
                'PAKET KOMBO HEMAT',
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

  

  Widget _buildPackageGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7, // Further increased aspect ratio for more height
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        itemCount: _packages.length,
        itemBuilder: (context, index) {
          final package = _packages[index];
          return _buildPackageCard(package);
        },
      ),
    );
  }

  Widget _buildPackageCard(Map<String, dynamic> package) {
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
                  package['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey,
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
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
                      package['name'],
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
                        package['price'],
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
                            id: package['name'].replaceAll(' ', '_').toLowerCase(),
                            name: package['name'],
                            price: package['price'],
                            image: package['image'],
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