import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../controllers/navigation_controller.dart';

class BottomBar extends StatelessWidget {

  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigation = Provider.of<NavigationController>(context, listen: false);
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      selectedItemColor: selectedColor,
      currentIndex: navigation.currentIndex,
      onTap: navigation.changeScreen,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          activeIcon: Icon(Icons.home, color: selectedColor),
          icon: Icon(Icons.home, color: secondaryColor)
        ),
        BottomNavigationBarItem(
          label: 'Shop',
          activeIcon: Icon(Icons.shopping_cart, color: selectedColor),
          icon: Icon(Icons.shopping_cart, color: secondaryColor)
        )
      ],
    );
  }

}
