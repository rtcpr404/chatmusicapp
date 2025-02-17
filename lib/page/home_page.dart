import 'package:flutter/material.dart';
import 'package:chatmusicapp/page/chatOnline.dart';
import 'package:chatmusicapp/page/favoriteSong.dart';
import 'package:chatmusicapp/page/profile.dart';
import 'package:chatmusicapp/page/searchMusic.dart';
import 'package:chatmusicapp/page/streaming.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          StreamingPage(),
          ChatOnlinePage(),
          searchMusic(),
          FavoriteSong(),
          MyProfile(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 60, // Adjust height
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: BottomAppBar(
          elevation: 0, // Remove the shadow
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavBarItem(Icons.home, 0),
              _buildBottomNavBarItem(Icons.chat_outlined, 1),
              _buildBottomNavBarItem(Icons.saved_search_outlined, 2),
              _buildBottomNavBarItem(Icons.favorite_border_outlined, 3),
              _buildBottomNavBarItem(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBarItem(IconData icon, int index) {
    final isActive = _selectedIndex == index;
    final color = isActive
        ? const Color.fromARGB(255, 255, 60, 0)
        : Color.fromARGB(255, 255, 106, 0);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 128, 34, 0).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 35,
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          });
        },
      ),
    );
  }
}
