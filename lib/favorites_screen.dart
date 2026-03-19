import 'package:flutter/material.dart';
import 'package:task5/favorites_provider.dartt';

// ═══════════════════════════════════════════
//  FavoritesScreen
// ═══════════════════════════════════════════
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final favs = FavoritesProvider();

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
        title: const Text(
          'المفضلة',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.favorite, color: Colors.white),
          SizedBox(width: 14),
        ],
      ),
      body: favs.items.isEmpty
          ? const _EmptyFavorites()
          : _FavoritesGrid(favs: favs),
    );
  }
}

// ═══════════════════════════════════════════
//  _EmptyFavorites
// ═══════════════════════════════════════════
class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.green[100]),
          const SizedBox(height: 16),
          Text(
            'لا يوجد منتجات في المفضلة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'اضغط على ❤️ على أي منتج لإضافته',
            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _FavoritesGrid
// ═══════════════════════════════════════════
class _FavoritesGrid extends StatelessWidget {
  final FavoritesProvider favs;
  const _FavoritesGrid({required this.favs});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsetsDirectional.all(12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.15,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, i) => _FavoriteCard(product: favs.items[i], favs: favs),
              childCount: favs.items.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _FavoriteCard
// ═══════════════════════════════════════════
class _FavoriteCard extends StatelessWidget {
  final Map<String, String> product;
  final FavoritesProvider favs;

  const _FavoriteCard({required this.product, required this.favs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FavoriteCardImage(product: product, favs: favs),
          _FavoriteCardInfo(product: product),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _FavoriteCardImage
// ═══════════════════════════════════════════
class _FavoriteCardImage extends StatelessWidget {
  final Map<String, String> product;
  final FavoritesProvider favs;

  const _FavoriteCardImage({required this.product, required this.favs});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(12),
            topEnd: Radius.circular(12),
          ),
          child: Image.asset(
            product['imagePath']!,
            width: double.infinity,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
        PositionedDirectional(
          top: 4,
          end: 4,
          child: GestureDetector(
            onTap: () => favs.toggle(product),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.favorite, size: 12, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _FavoriteCardInfo
// ═══════════════════════════════════════════
class _FavoriteCardInfo extends StatelessWidget {
  final Map<String, String> product;
  const _FavoriteCardInfo({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product['name']!,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 1),
          Text(
            product['price']!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 10,
              color: Colors.green[700],
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
