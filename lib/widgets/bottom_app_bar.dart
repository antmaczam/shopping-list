import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SBottomAppBar extends StatefulWidget {

  final void Function(int index) updateIndex;
  int index;
  SBottomAppBar({Key? key, required this.updateIndex, required this.index}):super(key:key);

  @override
  _SBottomAppBarState createState() => _SBottomAppBarState();

}

class _SBottomAppBarState extends State<SBottomAppBar> {

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      currentIndex: widget.index,
      onTap: widget.updateIndex,
      items: const [
        //onPressed: () => Navigator.pushNamed(context, '/home_list'),
        BottomNavigationBarItem(label: 'hola', icon: Icon(Icons.shopping_bag, color: secondaryColor)),
        BottomNavigationBarItem(label: 'adios',icon: Icon(Icons.home, color: secondaryColor))
      ],
    );
  }

}