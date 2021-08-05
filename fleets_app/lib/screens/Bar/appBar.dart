import 'package:flutter/material.dart';


class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Spacer(),
          Container(
            margin: const EdgeInsets.only(
              top: 15.0,
            ),
            height: 60,
            width: 60,
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 16.0),
              height: 20,
              width: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 16.0, right: 8.0),
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
