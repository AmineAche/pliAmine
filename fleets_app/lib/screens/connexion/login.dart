import 'dart:convert';
import 'package:fleets_app/screens/intro_app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class Token {
  Token(this.bearer);
  final String bearer;
  }

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    //double height = ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 50),
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
                controller: email,
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
                controller: password,
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
        ),
      ],
    );
  }

  Widget buildForgotPassbtn() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: () => print("Forgot Password pressed"),
            padding: EdgeInsets.only(right: 0),
            child: Text(
              "Mot de passe oublié ?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginBtn() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5,
            onPressed: () {
              //register(email.text, password.text);
              //Navigator.of(context).pushReplacementNamed('/Register');
              login(
              email.text, password.text);
              //Navigator.of(context).pushReplacementNamed('/Profil');
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
                  fontSize: 14,
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
  login(String email, password) async {
    if ((email == "") ||
        (password == "")) {
      showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: "Veuillez remplir les champs",
        ),
      );
    } else {
var data = {
          'email': email,
        'password': password,
      };
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      // var jsonData = null;
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      var response = await http.post(
        Uri.parse("http://192.168.56.1:8000/api/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      print(response.body);
      var ok = response.body;
      if (response.statusCode == 200) {
        String rawJson = '$ok';
        Map<String, dynamic> map = jsonDecode(rawJson);
        String bearer = map['token'];
        Token token = Token(bearer);
        print(token.bearer);
        setState(
          () {
            //isLoading = false;
            //sharedPreferences.setString('token', jsonData['token']);
            //Navigator.of(context).pushReplacementNamed('/HomePage');
          },
        );
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message: "Erreur lors la connexion",
          ),
        );
      }
    }
  }
}
