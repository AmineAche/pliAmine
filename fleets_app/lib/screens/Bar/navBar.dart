import 'dart:ui';
import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 35),
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.7),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33,
            color: Color(0xFF6DAED).withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 4.5,
            child: InkWell(
              onTap: () {
              },
              child: Container(
                width: 25,
                height: 25,
              ),
            ),
          ),
          Container(
            width: width / 4.5,
            child: InkWell(
              onTap: () {
              
              },
              child: Container(
                width: 35,
                height: 35,
              ),
            ),
          ),
          Container(
            width: width / 4.5,
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                width: 30,
                height: 30,
              ),
            ),
          ),
          Container(
            width: width / 4.5,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
