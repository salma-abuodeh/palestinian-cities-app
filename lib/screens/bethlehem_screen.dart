import 'package:flutter/material.dart';
import '../widgets/city_page_layout.dart';

class BethlehemScreen extends StatelessWidget {
  const BethlehemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CityPageLayout(
      title: 'Bethlehem',
      subtitle: 'Beit Lahm — City of the Nativity',
      imagePath: 'assets/images/bethlehem.webp',
      navIndex: 2,
      description:
          'Bethlehem is a Palestinian city in the southern West Bank, recognized worldwide as the birthplace of Jesus Christ. Home to the Church of the Nativity — a UNESCO World Heritage Site — the city draws millions of pilgrims each year. Beyond its religious significance, Bethlehem is celebrated for its fine olive wood carvings, mother-of-pearl crafts, and vibrant Manger Square.',
      infoItems: [
        InfoItem(icon: Icons.people_outline, value: '30K+', label: 'Population'),
        InfoItem(icon: Icons.calendar_today_outlined, value: '1350 BC', label: 'Founded'),
        InfoItem(icon: Icons.terrain_outlined, value: '765 m', label: 'Elevation'),
      ],
      listItems: [
        ListItem(title: 'Church of the Nativity', subtitle: 'UNESCO World Heritage Site, marking the birthplace of Jesus.'),
        ListItem(title: 'Manger Square', subtitle: 'The heart of the city, alive with pilgrims and celebrations.'),
        ListItem(title: 'Milk Grotto Chapel', subtitle: 'A sacred cave where the Holy Family sheltered.'),
        ListItem(title: 'Olive Wood Crafts', subtitle: 'Centuries-old tradition of hand-carved religious figurines.'),
        ListItem(title: 'Shepherds\' Field', subtitle: 'Where angels announced the birth of Jesus to shepherds.'),
        ListItem(title: 'Christmas Celebrations', subtitle: 'World-famous Christmas Eve mass and festivities each December.'),
      ],
      prevLabel: 'Jerusalem',
      prevRoute: '/jerusalem',
      nextLabel: 'Hebron',
      nextRoute: '/hebron',
    );
  }
}
