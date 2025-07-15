import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/view/pages/home_page.dart';
import 'package:aakrikada/features/ads/view/pages/my_products_page.dart';
import 'package:aakrikada/features/authantication/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBottomNavigationWidget extends HookWidget {
  const MyBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [HomePage(), MyProductsPage(), ProfilePage()];

    // index controller for bottom navigation
    final currentIndex = useState(0);

    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex.value = value;
        },
        currentIndex: currentIndex.value,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colorpallets.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'My Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
