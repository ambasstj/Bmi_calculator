import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeData.dark().primaryColor,
      title: const Text('Home Page'),
    );
  }
}
