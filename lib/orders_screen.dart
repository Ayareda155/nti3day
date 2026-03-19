import 'package:flutter/material.dart';

// ═══════════════════════════════════════════
//  OrdersScreen
// ═══════════════════════════════════════════
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: const _OrdersTabBar(),
        ),
        body: const _OrdersTabBarView(),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _OrdersTabBar
// ═══════════════════════════════════════════
class _OrdersTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _OrdersTabBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
      indicatorColor: Colors.white,
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
    );
  }
}

// ═══════════════════════════════════════════
//  _OrdersTabBarView
// ═══════════════════════════════════════════
class _OrdersTabBarView extends StatelessWidget {
  const _OrdersTabBarView();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        _OrdersList(orders: const [
          _OrderData(
            imagePath: 'assets/samsung_s26.jpeg',
            name: 'هاتف سامسونج S26 Ultra',
            brand: 'سامسونج',
            category: 'هواتف ذكية',
            price: '122,000 ج.م',
            status: 'قيد التنفيذ',
          ),
        ]),
        _OrdersList(orders: const [
          _OrderData(
            imagePath: 'assets/lenovo_thinkpad.jpeg',
            name: 'لابتوب لينوفو ThinkPad',
            brand: 'لينوفو',
            category: 'أجهزة كمبيوتر',
            price: '55,500 ج.م',
            status: 'مكتمل',
          ),
          _OrderData(
            imagePath: 'assets/samsung_flip.jpeg',
            name: 'سامسونج Z Flip',
            brand: 'سامسونج',
            category: 'هواتف ذكية',
            price: '89,000 ج.م',
            status: 'مكتمل',
          ),
        ]),
        _OrdersList(orders: const [
          _OrderData(
            imagePath: 'assets/lenovo_v15.jpeg',
            name: 'لابتوب لينوفو V15',
            brand: 'لينوفو',
            category: 'أجهزة كمبيوتر',
            price: '35,000 ج.م',
            status: 'ملغي',
          ),
        ]),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _OrderData  (data model)
// ═══════════════════════════════════════════
class _OrderData {
  final String imagePath, name, brand, category, price, status;
  const _OrderData({
    required this.imagePath,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.status,
  });
}

// ═══════════════════════════════════════════
//  _OrdersList
// ═══════════════════════════════════════════
class _OrdersList extends StatelessWidget {
  final List<_OrderData> orders;
  const _OrdersList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsetsDirectional.all(12),
      children: orders.map((o) => _OrderCard(order: o)).toList(),
    );
  }
}

// ═══════════════════════════════════════════
//  _OrderCard
// ═══════════════════════════════════════════
class _OrderCard extends StatelessWidget {
  final _OrderData order;
  const _OrderCard({required this.order});

  Color get _statusColor {
    if (order.status == 'مكتمل') return Colors.green;
    if (order.status == 'ملغي') return Colors.red;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          _OrderStatusBadge(status: order.status, color: _statusColor),
          const SizedBox(width: 8),
          _OrderInfo(order: order),
          const SizedBox(width: 8),
          _OrderImage(imagePath: order.imagePath),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _OrderStatusBadge
// ═══════════════════════════════════════════
class _OrderStatusBadge extends StatelessWidget {
  final String status;
  final Color color;

  const _OrderStatusBadge({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 7, color: color),
          const SizedBox(width: 3),
          Text(status, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _OrderInfo
// ═══════════════════════════════════════════
class _OrderInfo extends StatelessWidget {
  final _OrderData order;
  const _OrderInfo({required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order.name,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            '${order.brand} · ${order.category}',
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 2),
          Text(
            order.price,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.green[700], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _OrderImage
// ═══════════════════════════════════════════
class _OrderImage extends StatelessWidget {
  final String imagePath;
  const _OrderImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(imagePath, width: 52, height: 52, fit: BoxFit.cover),
    );
  }
}