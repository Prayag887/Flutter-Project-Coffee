// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffetype;
  final bool isSelect;
  final VoidCallback onTap;

  CoffeeType({
    required this.coffetype,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          coffetype,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelect ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
