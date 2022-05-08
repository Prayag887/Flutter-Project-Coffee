// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;
  final String coffeeWith;

  CoffeeTile({
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
    required this.coffeeWith,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 200,
        height: 200,
        // color: Colors.grey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //COFFEE IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                coffeeImagePath,
                // height: 150,
              ),
            ),

            //COFFEE NAME
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 23),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    coffeeWith,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),

            //PRICE TAG
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(coffeePrice),
                  Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
