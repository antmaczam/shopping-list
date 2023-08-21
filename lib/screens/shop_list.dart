import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

import '../widgets/bottom_bar.dart';

class ShopList extends StatelessWidget {

  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Shop list')
      ),
      body: const Center(
        child: Text('Bye!'),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }

}