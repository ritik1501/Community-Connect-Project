import 'package:book_donation/theme/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class OpeningView extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/splash-image.png",
      height: mq.size.height / 4,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.authLogin);
        },
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: ()  {
          Navigator.of(context).pushNamed(AppRoutes.authRegister);
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 80),
          child: registerButton,
        ),
      ],
    );

    final textrow = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[

        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
          child: Text(
            "Or Login with: ",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.yellow,
                    fontSize: 24
                )
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           SizedBox(
             height: 60,
             child:  RaisedButton(
               child: Icon(
                 FontAwesomeIcons.googlePlusG,
                 color: Colors.white,
                 size: 30,

               ),
               shape: CircleBorder(

               ),
               color: Color(0xffDB4437),
               onPressed: () {
                 //TODO: google login
               },
             ),
           ),

            SizedBox(
              height: 60,
              child: RaisedButton(
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Color(0xff00ACEE),
                  size: 30,
                ),
                shape: CircleBorder(),
                color: Colors.white,
                onPressed: () {
                  //TODO: twitter login
                },
              ),
            ),

            SizedBox(
              height: 60,
              child: RaisedButton(
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                  size: 30,
                ),
                shape: CircleBorder(),
                color: Color(0xff4267B2),
                onPressed: () {
                  //TODO: facebook login
                },
              ),
            )
          ],
        ),
      ],
    );


    return Scaffold(
      backgroundColor: Color(0xff8c52ff),
      body: Padding(
        padding: EdgeInsets.all((36)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: logo,
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: buttons,
            ),

            Padding(
              padding: EdgeInsets.only(top: 0),
              child: textrow,
            )




          ],
        )
        ,
      )
      ,
    );
  }
}
