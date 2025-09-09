import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/domain/model/categories_model.dart';
import 'package:aakrikada/features/ads/services/api_ads_services.dart';
import 'package:aakrikada/features/ads/view/pages/home_page.dart';
import 'package:aakrikada/features/ads/view/pages/my_products_page.dart';
import 'package:aakrikada/features/authantication/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBottomNavigationWidget extends HookWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    // ✅ hold API data in a hook state
    final categoryModel = useState<List<Category>?>(null);

    useEffect(() {
      Future.microtask(() async {
        final categoryData = await ApiAdsServices().getAdCategories();
        categoryModel.value = categoryData.data; // update state
      });
      return null;
    }, []);

    final pages = [
      HomePage(categoryModel: categoryModel.value),
      MyProductsPage(),
      ProfilePage(),
    ];

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
