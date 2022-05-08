// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //coffee ko list ani selected xa ki xaina
  final List coffeeType = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Americano',
      false,
    ],
    [
      'Espresso',
      false,
    ],
  ];

  //search bar ko tala user le tap grna milne banaako
  void coffeeTypeSelected(int index) {
    setState(() {
      //sabai option lai false banaako
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      //maathi ko false vaisakepaxi aba naya choose grda esle true banauxa
      coffeeType[index][1] = true;
    });
  }

//bottomnavigation bar lai tap grna milne banaako
  late int _selectedIndexForNavbar = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexForNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          //ya mathi ko const hatauna milxa
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        selectedItemColor: Colors.orange,
        currentIndex: _selectedIndexForNavbar, //New
        onTap: _onItemTapped,
        // bottom ma vako icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Coffee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_outlined),
            label: 'Notifications',
          ),
        ],
      ),
      body: Column(
        children: [
          //find the best coffee for u
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your favourite coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          //horizontal list view for coffee types (expresso, latte...)
          SizedBox(
            height: 35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffetype: coffeeType[index][0],
                    isSelect: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                }),
          ),
          //horizontal list for coffee (expresso latte ko tala vako view)
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: "lib/images/latte.png",
                  coffeeName: 'Latte',
                  coffeeWith: 'With Almond Milk',
                  coffeePrice: 'Rs 150',
                ),
                CoffeeTile(
                  coffeeImagePath: './lib/images/cappuccino.png',
                  coffeeName: 'Cappuccino',
                  coffeeWith: 'With Almond Milk',
                  coffeePrice: 'Rs 150',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/americano.png',
                  coffeeName: 'Americano',
                  coffeeWith: 'With Velvet Cupcake',
                  coffeePrice: 'Rs 150',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/espresso.png',
                  coffeeName: 'Espresso',
                  coffeeWith: 'Plain Butter Croissant',
                  coffeePrice: 'Rs 150',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
