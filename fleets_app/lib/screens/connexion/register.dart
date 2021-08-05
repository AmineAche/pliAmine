import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // appBar: AppBarMyBurger(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/register_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image(
                                width: 150,
                              image: new AssetImage('assets/icons/register.png'), 
                              fit: BoxFit.cover,
                            ),
                              Text(
                                "Inscription",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              buildName(),
                              SizedBox(
                                height: 20,
                              ),
                              buildEmail(),
                              SizedBox(
                                height: 20,
                              ),
                              buildPassword(),
                              SizedBox(
                                height: 20,
                              ),
                              buildPasswordConfirm(),
                              SizedBox(
                                height: 5,
                              ),
                              buildLoginBtn(),
                              buildSignupBtn(),
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
   Widget buildName() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 60,
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xff446AA8),
              ),
              hintText: 'Name',
              hintStyle: TextStyle(color: Color(0xFF4f7ed1)),
            ),
          ),
        ),
      ],
    );
   }
   Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff446AA8),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Color(0xFF4f7ed1)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff446AA8),
              ),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(color: Color(0xFF4f7ed1)),
            ),
          ),
        ),
      ],
    );
  }
   Widget buildPasswordConfirm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff446AA8),
              ),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(color: Color(0xFF4f7ed1)),
            ),
          ),
        ),
      ],
    );
  }


  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
            Navigator.pushNamed(
                  context,
                  '/HomePage',
                ); 
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          "Inscription",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildSignupBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/HomePage');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Déja un compte ? ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "Connection",
              style: TextStyle(
                color: Color(0xFF4f7ed1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}