import 'package:flutter/material.dart';
import '../widgets/city_page_layout.dart';

class HebronScreen extends StatelessWidget {
  const HebronScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CityPageLayout(
      title: 'Hebron',
      subtitle: 'Al-Khalil — The Largest City of the West Bank',
      imagePath: 'assets/images/hebron.jpg',
      navIndex: 3,
      description:
          'Hebron is the largest city in the West Bank and one of the oldest continuously inhabited cities in the world. It is home to the Ibrahimi Mosque, believed to be the burial site of the Patriarch Abraham. Famous for its hand-blown coloured glass, fine grapes, and premium olive oil, Hebron is also the economic engine of the West Bank.',
      infoItems: [
        InfoItem(icon: Icons.people_outline, value: '215K+', label: 'Population'),
        InfoItem(icon: Icons.calendar_today_outlined, value: '3500 BC', label: 'Founded'),
        InfoItem(icon: Icons.store_outlined, value: 'No. 1', label: 'WB Economy'),
      ],
      listItems: [
        ListItem(title: 'Ibrahimi Mosque', subtitle: 'Sacred to both Muslims and Jews as the Cave of Machpelah.'),
        ListItem(title: 'Hebron Glass', subtitle: 'Unique hand-blown coloured glass with centuries of tradition.'),
        ListItem(title: 'Grapes & Vineyards', subtitle: 'Hebron grapes have been prized since antiquity.'),
        ListItem(title: 'Old City Souq', subtitle: 'A labyrinthine market filled with spices, pottery, and leather.'),
        ListItem(title: 'Olive Oil', subtitle: 'Premium Palestinian olive oil produced in the surrounding hills.'),
        ListItem(title: 'Traditional Pottery', subtitle: 'Hand-thrown clay crafts passed down through generations.'),
      ],
      prevLabel: 'Bethlehem',
      prevRoute: '/bethlehem',
      nextLabel: 'Nablus',
      nextRoute: '/nablus',
    );
  }
}
