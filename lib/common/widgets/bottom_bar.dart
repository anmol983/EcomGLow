import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/cart/screens/cart_screen.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../features/account/screens/account_screen.dart';
import '../../features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        color:
            Colors.black, // Set bottom navigation bar background color to black
        child: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor:
              Colors.white, // Set selected item color to white for contrast
          unselectedItemColor: Colors.grey[400], // Set unselected item color
          backgroundColor: Colors.black, // Ensure the background is black
          iconSize: 28,
          elevation: 0, // Remove default elevation
          type: BottomNavigationBarType.fixed,
          onTap: updatePage,
          items: [
            // HOME
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                height: 50, // Adjust height if necessary
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: AnimatedOpacity(
                        opacity: _page == 0 ? 1.0 : 0.7,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                    if (_page == 0)
                      Positioned(
                        bottom: -5,
                        child: Container(
                          width: bottomBarWidth,
                          alignment: Alignment.center,
                          child: Text(
                            'HOME',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              label: '',
            ),
            // ACCOUNT
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                height: 50,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: AnimatedOpacity(
                        opacity: _page == 1 ? 1.0 : 0.7,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.person_outline_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                    if (_page == 1)
                      Positioned(
                        bottom: -5,
                        child: Container(
                          width: bottomBarWidth,
                          alignment: Alignment.center,
                          child: Text(
                            'MY ACCOUNT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              label: '',
            ),
            // CART
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                height: 50,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: AnimatedOpacity(
                        opacity: _page == 2 ? 1.0 : 0.7,
                        duration: const Duration(milliseconds: 300),
                        child: badges.Badge(
                          badgeContent: Text(
                            userCartLen.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          badgeStyle: badges.BadgeStyle(
                            elevation: 0,
                            badgeColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    if (_page == 2)
                      Positioned(
                        bottom: -5,
                        child: Container(
                          width: bottomBarWidth,
                          alignment: Alignment.center,
                          child: Text(
                            'Cart',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
