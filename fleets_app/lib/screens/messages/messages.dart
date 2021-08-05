import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MESSAGES",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [ 
        Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/messages_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 60),
              rechercheBar(),
            ],
          ),
        ),
      ),
      ],
      ),
    );
  }

  Widget rechercheBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 50,
          width: 250,
          child: TextField(
            style: TextStyle(
              color: Colors.black87,
            ),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,                      // Added this
          contentPadding: EdgeInsets.all(14), 
          hintText: 'Name',
          hintStyle: TextStyle(color: Color(0xFF4f7ed1)),

        ),
      )
        ),
        SizedBox(width: 20,),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child:  Icon(
                Icons.search,
                color: Color(0xff446AA8),
              ),
        ),
      ],
    );
  }
}
