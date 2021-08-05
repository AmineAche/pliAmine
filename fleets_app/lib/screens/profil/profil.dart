import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarMyBurger(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/login_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image(
                        width: 150,
                        image: new AssetImage('assets/icons/welcome.png'),
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Amine Ach",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildBarinfos("Trajets", 49),
                          buildBarinfos("Abonés", 50),
                          buildBarinfos("???", 165),
                          buildBarinfos("Abonnement", 89),
                        ],
                      ),
                       SizedBox(
                        height: 60,
                      ),
                      apropos(),
                      buildLoginBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBarinfos(String name, int number) {
    return Container(
      height: 60,
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 5),
          Text(
            number.toString(),
            style: TextStyle(
              color: Color(0xff30b2e5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/Messages');
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          "Mes messages",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget apropos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "A propos",
          style: TextStyle(
            color: Color(0xff1a85ef),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Je suis Amine, j'aime les romans et les animés.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ]
      ),
      ],
    );
  }
}
