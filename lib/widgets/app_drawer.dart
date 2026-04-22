import 'package:flutter/material.dart';
import '../theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
            color: AppColors.darkBrown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.public, size: 36, color: AppColors.tan),
                const SizedBox(height: 12),
                Text('Palestine Cities',
                    style: AppTextStyles.display(size: 20, color: AppColors.cream)),
                const SizedBox(height: 4),
                Text('Explorer', style: AppTextStyles.caption(size: 12, color: AppColors.sand)),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.tan),
          const SizedBox(height: 8),
          // Nav items
          _DrawerItem(icon: Icons.home_outlined, title: 'Home', route: '/'),
          _DrawerItem(icon: Icons.mosque_outlined, title: 'Jerusalem', route: '/jerusalem'),
          _DrawerItem(icon: Icons.church_outlined, title: 'Bethlehem', route: '/bethlehem'),
          _DrawerItem(icon: Icons.fort_outlined, title: 'Hebron', route: '/hebron'),
          _DrawerItem(icon: Icons.storefront_outlined, title: 'Nablus', route: '/nablus'),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  const _DrawerItem({required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name;
    final selected = current == route;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (!selected) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: selected ? AppColors.brown : Colors.transparent,
              width: 3,
            ),
          ),
          color: selected ? AppColors.sand.withOpacity(0.4) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: selected ? AppColors.brown : AppColors.tan),
            const SizedBox(width: 16),
            Text(title,
                style: AppTextStyles.nav(
                    color: selected ? AppColors.brown : AppColors.darkBrown)),
          ],
        ),
      ),
    );
  }
}
