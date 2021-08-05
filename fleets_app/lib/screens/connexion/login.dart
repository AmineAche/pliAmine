import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
            child: Stack(
            children: [
               Container(
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
                              image: new AssetImage('assets/icons/login.png'), 
                              fit: BoxFit.cover,
                            ),
                              Text(
                                "Connexion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              buildEmail(),
                              SizedBox(
                                height: 20,
                              ),
                              buildPassword(),
                              SizedBox(
                                height: 5,
                              ),
                              buildForgotPassbtn(),
                              buildLoginBtn(),
                              buildSignupBtn(),
                            ],
                          ),
                        ),
                    ],
              ),
            ),
            ],
            ),
          ),
      ),
    );
  }
   Widget buildEmail() {
    return Stack(
      children: [
        Column(
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

  Widget buildForgotPassbtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot Password pressed"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          "Mot de passe oublié ?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          //Navigator.of(context).pushReplacementNamed('/Register'); 
          Navigator.of(context).pushReplacementNamed('/Profil'); 
        }, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          "Connexion",
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
        Navigator.of(context).pushReplacementNamed('/Register');
      },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Pas encore inscrit ? ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Par ici.",
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