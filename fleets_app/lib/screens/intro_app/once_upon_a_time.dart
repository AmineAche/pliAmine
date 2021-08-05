import 'package:flutter/material.dart';

class OnceUponaTime extends StatelessWidget {

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
                    "Il était une fois",
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
                      "Profitez de l'instant pour y faire de belles rencontres car chaque trajet est une nouvelle histoire !"
                      ),
                      ),
                    ),
                    Center(
                    child: Text(
                      "Grâce à Fleets, vous vous sentirez dorénavent protégé ...."
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
                      Navigator.of(context).pushReplacementNamed('/Localisation');
                    },
                      child: Text("S'inscrire"),
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