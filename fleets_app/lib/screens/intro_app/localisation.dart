import 'package:flutter/material.dart';

class Localisation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/logs_infos_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  color: Colors.transparent,
                  child: new Column(
                    children: [
                    new Image(
                      image: new AssetImage('assets/icons/others_welcome_page.png'), 
                      fit: BoxFit.cover,
                    ),
                    Text(
                    "Localisation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 25.0),
                      child: Center(
                      child: Text(
                      "Profitez des fonctionnalités complètes :"
                      ),
                      ),
                    ),
                    Center(
                    child: Text(
                      "Suivez en temps réels vos amis"
                    ),
                    ),
                    ]
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/HomePage');
                    },
                      child: Text('Continuer'),
                    ),
                ),
              ],

            ),
          ),
        ),
    ),
    );
  }
}