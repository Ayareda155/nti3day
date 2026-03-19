import 'package:flutter/material.dart';

// ═══════════════════════════════════════════
//  SearchScreen
// ═══════════════════════════════════════════
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 0,
        title: const Text(
          'البحث',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(16),
              child: Column(
                children: [
                  _SearchField(
                    controller: controller,
                    onChanged: () => setState(() {}),
                  ),
                  if (controller.text.isEmpty) const _SearchEmptyState(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _SearchField
// ═══════════════════════════════════════════
class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;

  const _SearchField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        autofocus: true,
        onChanged: (_) => onChanged(),
        decoration: InputDecoration(
          hintText: 'ابحث عن أي منتج...',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          prefixIcon: const Icon(Icons.search, color: Colors.green),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    controller.clear();
                    onChanged();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _SearchEmptyState
// ═══════════════════════════════════════════
class _SearchEmptyState extends StatelessWidget {
  const _SearchEmptyState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Icon(Icons.search, size: 80, color: Colors.green[100]),
        const SizedBox(height: 16),
        Text(
          'ابحث عن أي شيء تريده',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'هواتف، لابتوب، إكسسوارات...',
          style: TextStyle(fontSize: 13, color: Colors.grey[400]),
        ),
      ],
    );
  }
}
