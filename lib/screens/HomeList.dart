import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

class HomeList extends StatelessWidget {
  final String title;

  const HomeList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(title)
      ),
      body: const Center(
        child: Text('holaaaaaaaaaaaaa'),
      ),
    );
  }}