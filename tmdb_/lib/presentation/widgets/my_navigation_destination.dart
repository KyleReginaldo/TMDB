import 'package:flutter/material.dart';

class MyNavigationDestination extends StatelessWidget {
  const MyNavigationDestination(
      {Key? key, required this.icon, this.label, required this.selectedIcon})
      : super(key: key);

  final Widget icon;
  final String? label;
  final Widget selectedIcon;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon,
      label: label ?? '',
      selectedIcon: selectedIcon,
    );
  }
}
