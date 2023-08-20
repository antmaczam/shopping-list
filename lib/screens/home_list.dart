import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

import '../widgets/bottom_bar.dart';

class HomeList extends StatelessWidget {

  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home list')
      ),
      body: const Center(
        child: Text('Hello!'),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }}