import 'package:flutter/material.dart';
import '../widgets/city_page_layout.dart';

class NablusScreen extends StatelessWidget {
  const NablusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CityPageLayout(
      title: 'Nablus',
      subtitle: 'Nablus — City of Soap and Sweets',
      imagePath: 'assets/images/nablus.jpg',
      navIndex: 4,
      description:
          'Nablus is a Palestinian city in the northern West Bank, nestled between Mount Gerizim and Mount Ebal. It is famous worldwide for two things: its knafeh — a sweet cheese pastry beloved across the Arab world — and its traditional Nabulsi olive oil soap, crafted for over a thousand years using the same ancient methods. The city\'s old souq and vibrant roundabouts reflect its proud urban character.',
      infoItems: [
        InfoItem(icon: Icons.people_outline, value: '170K+', label: 'Population'),
        InfoItem(icon: Icons.terrain_outlined, value: '550 m', label: 'Elevation'),
        InfoItem(icon: Icons.straighten_outlined, value: '72 km²', label: 'Area'),
      ],
      listItems: [
        ListItem(title: 'Knafeh', subtitle: 'World-famous sweet cheese pastry — Nablus is its birthplace.'),
        ListItem(title: 'Nabulsi Soap', subtitle: 'Traditional olive oil soap with over 1,000 years of history.'),
        ListItem(title: 'Old Souq', subtitle: 'A historic marketplace with spices, sweets, and local crafts.'),
        ListItem(title: 'Al-Nasr Mosque', subtitle: 'A historic mosque standing at the heart of the old city.'),
        ListItem(title: 'Mount Gerizim', subtitle: 'Sacred mountain overlooking the city, holy to the Samaritans.'),
        ListItem(title: 'Al-Qasaba', subtitle: 'The old casbah, one of the best-preserved in Palestine.'),
      ],
      prevLabel: 'Hebron',
      prevRoute: '/hebron',
      nextLabel: 'Home',
      nextRoute: '/',
    );
  }
}
