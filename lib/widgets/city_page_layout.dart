import 'package:flutter/material.dart';
import '../theme.dart';
import 'app_drawer.dart';

class CityPageLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String description;
  final List<InfoItem> infoItems;
  final List<ListItem> listItems;
  final int navIndex;
  final String? prevLabel;
  final String? prevRoute;
  final String? nextLabel;
  final String? nextRoute;

  const CityPageLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.description,
    required this.infoItems,
    required this.listItems,
    required this.navIndex,
    this.prevLabel,
    this.prevRoute,
    this.nextLabel,
    this.nextRoute,
  });

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined),         label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.mosque_outlined),       label: 'Jerusalem'),
    BottomNavigationBarItem(icon: Icon(Icons.church_outlined),       label: 'Bethlehem'),
    BottomNavigationBarItem(icon: Icon(Icons.fort_outlined),         label: 'Hebron'),
    BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined),   label: 'Nablus'),
  ];

  static const List<String> _routes = ['/', '/jerusalem', '/bethlehem', '/hebron', '/nablus'];

  void _onNavTapped(BuildContext context, int index) {
    if (index == navIndex) return;
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.tan),
        ),
      ),
      drawer: const AppDrawer(),
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (i) => _onNavTapped(context, i),
        items: _navItems,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Hero Image ──────────────────────────────────
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(imagePath, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.darkBrown.withOpacity(0.68),
                        ],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 20,
                    right: 20,
                    child: Text(
                      subtitle,
                      style: AppTextStyles.caption(size: 13, color: AppColors.sand),
                    ),
                  ),
                ],
              ),
            ),

            // ── Info strip ──────────────────────────────────
            Container(
              color: AppColors.darkBrown,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: infoItems.map((item) => _InfoBadge(item: item)).toList(),
              ),
            ),

            // ── About section ───────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 26, 20, 10),
              child: Text('About the City', style: AppTextStyles.heading(size: 18)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.sand.withOpacity(0.35),
                border: Border(left: BorderSide(color: AppColors.tan, width: 3)),
              ),
              child: Text(description, style: AppTextStyles.body(size: 14)),
            ),

            // ── Ornamental divider ───────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(children: [
                Expanded(child: Divider(color: AppColors.tan)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.circle, size: 6, color: AppColors.tan),
                ),
                Expanded(child: Divider(color: AppColors.tan)),
              ]),
            ),

            // ── Highlights ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
              child: Text('Highlights', style: AppTextStyles.heading(size: 18)),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: listItems.length,
              separatorBuilder: (_, __) => Divider(color: AppColors.sand, height: 1),
              itemBuilder: (context, index) {
                final item = listItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.brown,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: AppTextStyles.caption(size: 11, color: AppColors.cream),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: AppTextStyles.body(size: 14, weight: FontWeight.w700)),
                            const SizedBox(height: 3),
                            Text(item.subtitle, style: AppTextStyles.caption(size: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // ── Prev / Next buttons ─────────────────────────
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  if (prevLabel != null && prevRoute != null) ...[
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, prevRoute!),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.brown,
                          side: const BorderSide(color: AppColors.brown),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        icon: const Icon(Icons.arrow_back, size: 16),
                        label: Text(prevLabel!,
                            style: AppTextStyles.caption(size: 12, color: AppColors.brown)),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  if (nextLabel != null && nextRoute != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, nextRoute!),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brown,
                          foregroundColor: AppColors.cream,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        icon: const Icon(Icons.arrow_forward, size: 16),
                        label: Text(nextLabel!,
                            style: AppTextStyles.caption(size: 12, color: AppColors.cream)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

// ── Data models ───────────────────────────────────────────

class InfoItem {
  final IconData icon;
  final String value;
  final String label;
  const InfoItem({required this.icon, required this.value, required this.label});
}

class ListItem {
  final String title;
  final String subtitle;
  const ListItem({required this.title, required this.subtitle});
}

// ── Info badge ────────────────────────────────────────────

class _InfoBadge extends StatelessWidget {
  final InfoItem item;
  const _InfoBadge({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(item.icon, color: AppColors.tan, size: 22),
        const SizedBox(height: 5),
        Text(item.value,
            style: AppTextStyles.body(size: 13, color: AppColors.cream, weight: FontWeight.w600)),
        Text(item.label,
            style: AppTextStyles.caption(size: 10, color: AppColors.sand)),
      ],
    );
  }
}
