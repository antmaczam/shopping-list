import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/index.dart';
import 'screens/index.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ListenableProvider<NavigationController>(create: (_) => NavigationController()),
          ],
          child: const NavApp()
      )
  );
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigation = Provider.of<NavigationController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        onPopPage: (route, result) {
          bool popStatus = route.didPop(result);
          if(popStatus) Provider.of<NavigationController>(context, listen: false).changeScreen(0);
          return popStatus;
        },
        pages: [
          if(navigation.screenName == '/home') const MaterialPage(child: HomeList()),
          if(navigation.screenName == '/shop') const MaterialPage(child: ShopList()),
        ],
      ),
    );
  }
}