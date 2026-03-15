import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 0,
        title: const Text(
          'طلباتي',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_outlined, color: Colors.white),
          SizedBox(width: 14),
        ],
      ),

      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // ── TabBar ──
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.green[700],
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green[700],
                tabs: const [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('قيد التوصيل'),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ),
                  Tab(text: 'مكتملة'),
                  Tab(text: 'ملغية'),
                ],
              ),
            ),

            // ── TabBarView ──
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: قيد التوصيل
                  ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      _CartCard(
                        imagePath: 'assets/samsung_s26.jpeg',
                        name: 'هاتف سامسونج S26 Ultra',
                        brand: 'سامسونج',
                        category: 'هواتف ذكية',
                        price: '122,000 ج.م',
                        status: 'قيد التنفيذ',
                      ),
                    ],
                  ),

                  // Tab 2: مكتملة
                  ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      _CartCard(
                        imagePath: 'assets/lenovo_thinkpad.jpeg',
                        name: 'لابتوب لينوفو ThinkPad',
                        brand: 'لينوفو',
                        category: 'أجهزة كمبيوتر',
                        price: '55,500 ج.م',
                        status: 'مكتمل',
                      ),
                      _CartCard(
                        imagePath: 'assets/samsung_flip.jpeg',
                        name: 'سامسونج Z Flip',
                        brand: 'سامسونج',
                        category: 'هواتف ذكية',
                        price: '89,000 ج.م',
                        status: 'مكتمل',
                      ),
                    ],
                  ),

                  // Tab 3: ملغية
                  ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      _CartCard(
                        imagePath: 'assets/lenovo_v15.jpeg',
                        name: 'لابتوب لينوفو V15',
                        brand: 'لينوفو',
                        category: 'أجهزة كمبيوتر',
                        price: '35,000 ج.م',
                        status: 'ملغي',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Cart Card ──
class _CartCard extends StatelessWidget {
  final String imagePath;
  final String name, brand, category, price, status;
  const _CartCard({
    required this.imagePath,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'مكتمل'
        ? Colors.green
        : status == 'ملغي'
        ? Colors.red
        : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.circle, size: 8, color: statusColor),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$brand · $category',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
