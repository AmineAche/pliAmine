import 'package:flutter/material.dart';


class NavBar extends StatefulWidget {

  NavBar({
    Key key, this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


   void _onItemTap(int index) {
    print(index);
    if (index == widget.selectedIndex) {
      print("tu es déjà sur cette page");
    } else {
    if (index == 0) {
    Navigator.of(context).pushReplacementNamed('/Profil');
    } else if (index == 1) {
    Navigator.of(context).pushReplacementNamed('/Profil');
    }
    else if (index == 2) {
    Navigator.of(context).pushReplacementNamed('/Messages');
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              'Profile',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem( 
            icon: Icon(
              Icons.message,
            ),
            title: Text(
              'Fleets',
            ),
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      );
  }
}
