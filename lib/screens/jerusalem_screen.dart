import 'package:flutter/material.dart';
import '../widgets/city_page_layout.dart';

class JerusalemScreen extends StatelessWidget {
  const JerusalemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CityPageLayout(
      title: 'Jerusalem',
      subtitle: 'Al-Quds — The Eternal City of Three Faiths',
      imagePath: 'assets/images/jerusalem.jpg',
      navIndex: 1,
      description:
          'Jerusalem is one of the oldest cities in the world and is considered holy to Judaism, Christianity, and Islam. The Old City contains some of the most revered sites on earth — the Al-Aqsa Mosque, the Western Wall, and the Church of the Holy Sepulchre — all within walking distance of one another, bearing witness to thousands of years of history.',
      infoItems: [
        InfoItem(icon: Icons.people_outline, value: '900K+', label: 'Population'),
        InfoItem(icon: Icons.calendar_today_outlined, value: '3000 BC', label: 'Founded'),
        InfoItem(icon: Icons.terrain_outlined, value: '754 m', label: 'Elevation'),
      ],
      listItems: [
        ListItem(title: 'Al-Aqsa Mosque', subtitle: 'The third holiest site in Islam, on the Temple Mount.'),
        ListItem(title: 'Dome of the Rock', subtitle: 'Iconic Islamic shrine with its golden dome, built in 691 AD.'),
        ListItem(title: 'Church of the Holy Sepulchre', subtitle: 'One of the holiest sites in Christianity.'),
        ListItem(title: 'Old City Walls', subtitle: 'Ottoman-era walls enclosing the historic old city.'),
        ListItem(title: 'Damascus Gate', subtitle: 'The grandest and most magnificent gate of the Old City.'),
        ListItem(title: 'Via Dolorosa', subtitle: 'The sacred path Jesus walked to his crucifixion.'),
      ],
      nextLabel: 'Bethlehem',
      nextRoute: '/bethlehem',
    );
  }
}
