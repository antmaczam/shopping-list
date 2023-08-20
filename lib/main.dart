import 'package:flutter/material.dart';
import 'package:shopping_list/screens/HomeList.dart';
import 'package:shopping_list/widgets/bottom_app_bar.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping list',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Lista de la compra')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}):super(key:key);
  final String title;
  int selectedIndex = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.title, style: const TextStyle(color: Colors.deepPurple)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('${widget.selectedIndex}', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.shopping_cart, color: secondaryColor),
      ),
      bottomNavigationBar: SBottomAppBar(updateIndex: _updateIndex, index: widget.selectedIndex),
    );
  }

  void _updateIndex(int index) {
    setState(() => widget.selectedIndex = index);
  }

}
