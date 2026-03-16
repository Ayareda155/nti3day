import 'package:flutter/material.dart';
import 'ShopScreen.dart';
import 'orders_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSize = 100;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20;
  runApp(const MyApp());
}

// ── No Overscroll Behavior ──
class NoOverscrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoOverscrollBehavior(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [ShopScreen(), OrdersScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex == 2 ? 1 : 0],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}
