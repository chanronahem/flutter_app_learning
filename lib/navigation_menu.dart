import 'package:flutter/material.dart';
import 'package:flutter_app_learning/features/shop/screens/home/home.dart';
import 'package:flutter_app_learning/features/shop/screens/store/store.dart';
import 'package:flutter_app_learning/utils/constants/colors.dart';
import 'package:flutter_app_learning/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    // return Scaffold(
    //   bottomNavigationBar: NavigationBar(
    //     destinations:const [
    //       NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
    //       NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
    //       NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
    //       NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
    //     ],
    //   ),
    // );

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
  ];
}
