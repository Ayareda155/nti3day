import 'package:flutter/material.dart';
import 'package:task5/favorites_provider.dartt';

// ═══════════════════════════════════════════
//  ShopScreen
// ═══════════════════════════════════════════
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectedCat = 1;
  final favs = FavoritesProvider();

  final categories = [
    {'icon': Icons.checkroom, 'label': 'ملابس'},
    {'icon': Icons.phone_android, 'label': 'إلكترونيات'},
    {'icon': Icons.home, 'label': 'منزل'},
    {'icon': Icons.menu_book, 'label': 'كتب'},
    {'icon': Icons.sports_esports, 'label': 'ألعاب'},
    {'icon': Icons.headset_mic, 'label': 'إكسسوارات'},
    {'icon': Icons.card_giftcard, 'label': 'هدايا'},
    {'icon': Icons.spa, 'label': 'العناية'},
    {'icon': Icons.videogame_asset, 'label': 'Gaming'},
  ];

  final products = [
    {
      'imagePath': 'assets/samsung_s26.jpeg',
      'name': 'سامسونج S26 Ultra',
      'price': '122,000 ج.م',
      'category': 'هواتف ذكية',
    },
    {
      'imagePath': 'assets/samsung_flip.jpeg',
      'name': 'سامسونج Z Flip',
      'price': '89,000 ج.م',
      'category': 'هواتف ذكية',
    },
    {
      'imagePath': 'assets/lenovo_thinkpad.jpeg',
      'name': 'لينوفو ThinkPad',
      'price': '55,500 ج.م',
      'category': 'لابتوب',
    },
    {
      'imagePath': 'assets/lenovo_v15.jpeg',
      'name': 'لينوفو V15',
      'price': '35,000 ج.م',
      'category': 'لابتوب',
    },
  ];

  @override
  void initState() {
    super.initState();
    favs.addListener(() => setState(() {}));
  }

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
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShopBanner(),
                const SizedBox(height: 12),
                _SectionTitle(title: 'الفئات'),
                const SizedBox(height: 8),
                _CategoriesRow(
                  categories: categories,
                  selectedCat: selectedCat,
                  onCatSelected: (i) => setState(() => selectedCat = i),
                ),
                const SizedBox(height: 12),
                if (selectedCat == 1) ...[
                  _SectionTitle(title: 'منتجات مميزة'),
                  const SizedBox(height: 8),
                  _HorizontalProductList(products: products, favs: favs),
                  const SizedBox(height: 12),
                  _SectionTitle(title: 'شبكة المنتجات'),
                  const SizedBox(height: 8),
                  _ProductsGrid(products: products, favs: favs),
                ] else
                  _ComingSoon(
                    icon: categories[selectedCat]['icon'] as IconData,
                    label: categories[selectedCat]['label'] as String,
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ShopBanner
// ═══════════════════════════════════════════
class _ShopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(28),
          bottomEnd: Radius.circular(28),
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
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'ابحث عن منتج...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                prefixIcon: Icon(Icons.search, color: Colors.green),
                border: InputBorder.none,
                contentPadding: EdgeInsetsDirectional.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _SectionTitle
// ═══════════════════════════════════════════
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'عرض الكل',
            style: TextStyle(fontSize: 12, color: Colors.green[700]),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _CategoriesRow
// ═══════════════════════════════════════════
class _CategoriesRow extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final int selectedCat;
  final ValueChanged<int> onCatSelected;

  const _CategoriesRow({
    required this.categories,
    required this.selectedCat,
    required this.onCatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final isActive = selectedCat == i;
          return GestureDetector(
            onTap: () => onCatSelected(i),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.green[700] : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      categories[i]['icon'] as IconData,
                      color: isActive ? Colors.white : Colors.green[700],
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    categories[i]['label'] as String,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isActive
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isActive ? Colors.green[700] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _HorizontalProductList
// ═══════════════════════════════════════════
class _HorizontalProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final FavoritesProvider favs;

  const _HorizontalProductList({required this.products, required this.favs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: products.length,
          itemBuilder: (context, i) => Directionality(
            textDirection: TextDirection.rtl,
            child: _ProductCard(product: products[i], favs: favs),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ProductsGrid
// ═══════════════════════════════════════════
class _ProductsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final FavoritesProvider favs;

  const _ProductsGrid({required this.products, required this.favs});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.15,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) => _GridCard(product: products[i], favs: favs),
    );
  }
}

// ═══════════════════════════════════════════
//  _ComingSoon
// ═══════════════════════════════════════════
class _ComingSoon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ComingSoon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 60),
        child: Column(
          children: [
            Icon(icon, size: 64, color: Colors.green[200]),
            const SizedBox(height: 16),
            Text(
              'قسم $label',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'قريباً... 🚀',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ProductCard  (الأفقي)
// ═══════════════════════════════════════════
class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final FavoritesProvider favs;

  const _ProductCard({required this.product, required this.favs});

  @override
  Widget build(BuildContext context) {
    final isFav = favs.isFav(product['imagePath']);
    return Container(
      width: 120,
      margin: const EdgeInsetsDirectional.only(end: 8, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12),
                  topEnd: Radius.circular(12),
                ),
                child: Image.asset(
                  product['imagePath'],
                  width: double.infinity,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      product['price'],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: 4,
            end: 4,
            child: GestureDetector(
              onTap: () => favs.toggle(Map<String, String>.from(product)),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  size: 12,
                  color: isFav ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _GridCard  (الشبكة)
// ═══════════════════════════════════════════
class _GridCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final FavoritesProvider favs;

  const _GridCard({required this.product, required this.favs});

  @override
  Widget build(BuildContext context) {
    final isFav = favs.isFav(product['imagePath']);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12),
                  topEnd: Radius.circular(12),
                ),
                child: Image.asset(
                  product['imagePath'],
                  width: double.infinity,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              PositionedDirectional(
                top: 4,
                end: 4,
                child: GestureDetector(
                  onTap: () => favs.toggle(Map<String, String>.from(product)),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      size: 12,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  product['price'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
