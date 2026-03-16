import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selectedCat = 1; // 0=ملابس، 1=إلكترونيات، 2=منزل، 3=كتب، 4=ألعاب

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.checkroom, 'label': 'ملابس'},
    {'icon': Icons.phone_android, 'label': 'إلكترونيات'},
    {'icon': Icons.home, 'label': 'منزل'},
    {'icon': Icons.menu_book, 'label': 'كتب'},
    {'icon': Icons.sports_esports, 'label': 'ألعاب'},
  ];

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
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header Banner ──
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
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
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.green,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                              ),
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 85,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        final cat = _categories[index];
                        final isActive = _selectedCat == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCat = index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 52,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? Colors.green[700]
                                        : Colors.white,
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
                                    cat['icon'] as IconData,
                                    color: isActive
                                        ? Colors.white
                                        : Colors.green[700],
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cat['label'] as String,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isActive
                                        ? Colors.green[700]
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Content based on selected category ──
                  if (_selectedCat == 1) ...[
                    // إلكترونيات - تعرض المنتجات
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'منتجات مميزة',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'عرض الكل',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: const [
                          _ProductCard(
                            imagePath: 'assets/samsung_s26.jpeg',
                            name: 'سامسونج S26 Ultra',
                            price: '122,000 ج.م',
                          ),
                          _ProductCard(
                            imagePath: 'assets/samsung_flip.jpeg',
                            name: 'سامسونج Z Flip',
                            price: '89,000 ج.م',
                          ),
                          _ProductCard(
                            imagePath: 'assets/lenovo_thinkpad.jpeg',
                            name: 'لينوفو ThinkPad',
                            price: '55,500 ج.م',
                          ),
                          _ProductCard(
                            imagePath: 'assets/lenovo_v15.jpeg',
                            name: 'لينوفو V15',
                            price: '35,000 ج.م',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'شبكة المنتجات',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'عرض الكل',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                            ),
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
                      childAspectRatio: 0.72,
                      children: const [
                        _GridCard(
                          imagePath: 'assets/samsung_s26.jpeg',
                          name: 'سامسونج S26 Ultra',
                          price: '122,000 ج.م',
                        ),
                        _GridCard(
                          imagePath: 'assets/samsung_flip.jpeg',
                          name: 'سامسونج Z Flip',
                          price: '89,000 ج.م',
                        ),
                        _GridCard(
                          imagePath: 'assets/lenovo_thinkpad.jpeg',
                          name: 'لينوفو ThinkPad',
                          price: '55,500 ج.م',
                        ),
                        _GridCard(
                          imagePath: 'assets/lenovo_v15.jpeg',
                          name: 'لينوفو V15',
                          price: '35,000 ج.م',
                        ),
                      ],
                    ),
                  ] else ...[
                    // باقي الـ categories - رسالة قريباً
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: Column(
                          children: [
                            Icon(
                              _categories[_selectedCat]['icon'] as IconData,
                              size: 64,
                              color: Colors.green[200],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'قسم ${_categories[_selectedCat]['label']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'قريباً... 🚀',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Product Card ──
class _ProductCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  const _ProductCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: 110,
                  fit: BoxFit.cover,
                  cacheWidth: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.name,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.price,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: GestureDetector(
              onTap: () => setState(() => _isFav = !_isFav),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(
                  _isFav ? Icons.favorite : Icons.favorite_border,
                  size: 16,
                  color: _isFav ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Grid Card ──
class _GridCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  const _GridCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  State<_GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<_GridCard> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Image.asset(
              widget.imagePath,
              width: double.infinity,
              height: 130,
              fit: BoxFit.cover,
              cacheWidth: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isFav = !_isFav),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: _isFav
                              ? Colors.red.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _isFav ? Icons.favorite : Icons.favorite_border,
                              size: 14,
                              color: _isFav ? Colors.red : Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _isFav ? 'مضاف' : 'مفضلة',
                              style: TextStyle(
                                fontSize: 10,
                                color: _isFav ? Colors.red : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
