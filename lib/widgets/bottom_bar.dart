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
      currentIndex: navigation.currentIndex,
      onTap: navigation.changeScreen,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home, color: secondaryColor)
        ),
        BottomNavigationBarItem(
          label: 'Shop',
          icon: Icon(Icons.shopping_bag, color: secondaryColor)
        )
      ],
    );
  }

}
