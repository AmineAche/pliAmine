import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class Error {
  final String message;

  Error(this.message);
}

class _RegisterState extends State<Register> {
  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController age = new TextEditingController();
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBarMyBurger(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/register_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image(
                        width: 120,
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
                        height: 30,
                      ),
                      buildName(0),
                      SizedBox(
                        height: 15,
                      ),
                      buildName(1),
                      SizedBox(
                        height: 15,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 15,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      buildRegisterBtn(),
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

  Widget buildName(int name) {
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
          height: 50,
          child: TextField(
            controller: (name == 0) ? firstname : lastname,
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
              hintText: (name == 0) ? 'Prenom' : 'Nom',
              hintStyle: TextStyle(color: Color(0xFF4f7ed1)),
            ),
          ),
        ),
      ],
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
              height: 50,
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
          height: 50,
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
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          register(
              email.text, password.text, firstname.text, lastname.text, 10);
          // Navigator.pushNamed(
          //   context,
          //   '/HomePage',
          // );
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
            fontSize: 14,
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
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "Connexion",
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

  register(String email, password, firstname, lastname, age) async {
    print(email);
    if ((email == "") ||
        (password == "") ||
        (firstname == "") ||
        (lastname == "") ||
        (age == "")) {
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
        'firstname': firstname,
        'lastname': lastname,
        'age': age
      };
      var jsonData = null;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // var jsonData = null;
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      var response = await http.post(
        Uri.parse("http://192.168.56.1:8000/api/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        print('oui');
        setState(
          () {
            //isLoading = false;
            //sharedPreferences.setString('token', jsonData['token']);
            Navigator.of(context).pushReplacementNamed('/HomePage');
          },
        );
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message: "Erreur lors l'inscription",
          ),
        );
      }
    }
  }
}
