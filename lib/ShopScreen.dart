import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          'الرئيسية',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          SizedBox(width: 14),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header Banner ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أهلاً 👋',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'اكتشف أحدث المنتجات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'ابحث عن منتج...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        prefixIcon: Icon(Icons.search, color: Colors.green),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Categories ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'الفئات',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 85,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  _CatItem(icon: Icons.checkroom, label: 'ملابس', active: true),
                  _CatItem(
                    icon: Icons.phone_android,
                    label: 'إلكترونيات',
                    active: false,
                  ),
                  _CatItem(icon: Icons.home, label: 'منزل', active: false),
                  _CatItem(icon: Icons.menu_book, label: 'كتب', active: false),
                  _CatItem(
                    icon: Icons.sports_esports,
                    label: 'ألعاب',
                    active: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Featured ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'منتجات مميزة',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'عرض الكل',
                    style: TextStyle(fontSize: 12, color: Colors.green[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  _ProductCard(
                    imagePath: 'assets/samsung_s26.jpeg',
                    name: 'سامسونج S26',
                  ),
                  _ProductCard(
                    imagePath: 'assets/samsung_flip.jpeg',
                    name: 'سامسونج Flip',
                  ),
                  _ProductCard(
                    imagePath: 'assets/lenovo_thinkpad.jpeg',
                    name: 'لينوفو ThinkPad',
                  ),
                  _ProductCard(
                    imagePath: 'assets/lenovo_v15.jpeg',
                    name: 'لينوفو V15',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Grid ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'شبكة المنتجات',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'عرض الكل',
                    style: TextStyle(fontSize: 12, color: Colors.green[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
              children: const [
                _GridCard(
                  imagePath: 'assets/samsung_s26.jpeg',
                  name: 'سامسونج S26',
                ),
                _GridCard(
                  imagePath: 'assets/samsung_flip.jpeg',
                  name: 'سامسونج Flip',
                ),
                _GridCard(
                  imagePath: 'assets/lenovo_thinkpad.jpeg',
                  name: 'لينوفو ThinkPad',
                ),
                _GridCard(
                  imagePath: 'assets/lenovo_v15.jpeg',
                  name: 'لينوفو V15',
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ── Category Item ──
class _CatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _CatItem({
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: active ? Colors.green[700] : Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: active ? Colors.white : Colors.green[700],
              size: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

// ── Product Card ──
class _ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  const _ProductCard({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Grid Card ──
class _GridCard extends StatelessWidget {
  final String imagePath;
  final String name;
  const _GridCard({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
