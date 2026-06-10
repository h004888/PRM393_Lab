import 'package:flutter/material.dart';

class Buttonbar extends StatelessWidget {
  const Buttonbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Detail",
          icon: Icon(Icons.details),
        ),
        BottomNavigationBarItem(
          label: "About",
          icon: Icon(Icons.account_box_outlined),
        ),
      ],
    );
  }
}
