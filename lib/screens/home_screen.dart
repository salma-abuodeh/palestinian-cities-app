import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Map<String, dynamic>> _cities = [
    {
      'name': 'Jerusalem',
      'route': '/jerusalem',
      'icon': Icons.mosque_outlined,
      'image': 'assets/images/jerusalem.jpg',
      'sub': 'City of three faiths',
    },
    {
      'name': 'Bethlehem',
      'route': '/bethlehem',
      'icon': Icons.church_outlined,
      'image': 'assets/images/bethlehem.webp',
      'sub': 'City of the Nativity',
    },
    {
      'name': 'Hebron',
      'route': '/hebron',
      'icon': Icons.fort_outlined,
      'image': 'assets/images/hebron.jpg',
      'sub': 'Oldest inhabited city',
    },
    {
      'name': 'Nablus',
      'route': '/nablus',
      'icon': Icons.storefront_outlined,
      'image': 'assets/images/nablus.jpg',
      'sub': 'City of soap & sweets',
    },
  ];

  static const List<Map<String, dynamic>> _facts = [
    {
      'icon': Icons.history_edu_outlined,
      'title': 'Ancient History',
      'sub': 'Palestinian cities span more than 5,000 years of civilisation.',
    },
    {
      'icon': Icons.architecture_outlined,
      'title': 'Rich Architecture',
      'sub': 'A unique blend of Islamic, Byzantine, Crusader, and Ottoman styles.',
    },
    {
      'icon': Icons.restaurant_outlined,
      'title': 'Renowned Cuisine',
      'sub': 'Knafeh, maqluba, musakhan, and mansaf — each city has its signature dish.',
    },
    {
      'icon': Icons.palette_outlined,
      'title': 'Living Crafts',
      'sub': 'Embroidery, olive wood carving, glass-blowing, and soap-making.',
    },
  ];

  void _onBottomNavTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index > 0) {
      final route = _cities[index - 1]['route'] as String;
      Navigator.pushNamed(context, route).then((_) {
        setState(() => _selectedIndex = 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Palestine Cities Explorer'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.tan),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Hero Banner ──────────────────────────────────
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/palestine.jpg', fit: BoxFit.cover),
                  // dark gradient overlay
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.darkBrown.withOpacity(0.3),
                          AppColors.darkBrown.withOpacity(0.72),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Explore Palestine',
                            style: AppTextStyles.display(size: 32, color: AppColors.cream),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Container(width: 50, height: 1, color: AppColors.tan),
                          const SizedBox(height: 10),
                          Text(
                            'A journey through history, culture and heritage',
                            style: AppTextStyles.caption(size: 13, color: AppColors.sand),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Cities Grid ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
              child: Text('Cities', style: AppTextStyles.heading(size: 16)),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                final city = _cities[index];
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, city['route'] as String),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // City photo as background
                        Image.asset(
                          city['image'] as String,
                          fit: BoxFit.cover,
                        ),
                        // Gradient overlay — transparent top, dark bottom
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.darkBrown.withOpacity(0.82),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.35, 1.0],
                            ),
                          ),
                        ),
                        // Icon top-left
                        Positioned(
                          top: 10,
                          left: 12,
                          child: Icon(
                            city['icon'] as IconData,
                            color: AppColors.sand.withOpacity(0.85),
                            size: 22,
                          ),
                        ),
                        // Text bottom-left
                        Positioned(
                          bottom: 12,
                          left: 14,
                          right: 14,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city['name'] as String,
                                style: AppTextStyles.body(
                                  size: 15,
                                  color: AppColors.cream,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                city['sub'] as String,
                                style: AppTextStyles.caption(
                                    size: 11, color: AppColors.sand),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // ── Divider ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Row(children: [
                Expanded(child: Divider(color: AppColors.tan)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.circle, size: 6, color: AppColors.tan),
                ),
                Expanded(child: Divider(color: AppColors.tan)),
              ]),
            ),

            // ── Quick Facts ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
              child: Text('Quick Facts', style: AppTextStyles.heading(size: 16)),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _facts.length,
              separatorBuilder: (_, __) =>
                  Divider(color: AppColors.sand, height: 1),
              itemBuilder: (context, index) {
                final fact = _facts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(fact['icon'] as IconData,
                          color: AppColors.brown, size: 22),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fact['title'] as String,
                                style: AppTextStyles.body(
                                    size: 14, weight: FontWeight.w600)),
                            const SizedBox(height: 2),
                            Text(fact['sub'] as String,
                                style: AppTextStyles.caption(size: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mosque_outlined), label: 'Jerusalem'),
          BottomNavigationBarItem(
              icon: Icon(Icons.church_outlined), label: 'Bethlehem'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fort_outlined), label: 'Hebron'),
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined), label: 'Nablus'),
        ],
      ),
    );
  }
}
