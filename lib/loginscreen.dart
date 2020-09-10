import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Color primaryColor = Color(0xff341d74);
  Color secondaryColor = Color(0xff5e35b1);
  Color logoGreen = Color(0xff1565c0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            Text(
              'Sign in to Book Donation App and continue',
              textAlign: TextAlign.center,
              style:
              GoogleFonts.openSans(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your email and password below to continue to the Book Donation App!',
              textAlign: TextAlign.center,
              style:
              GoogleFonts.openSans(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: 50,
            ),
            buildTextField('Email', Icons.account_circle),
            SizedBox(height: 10),
            buildTextField('Password', Icons.lock),
            SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async{
                User firebaseUser;
                firebaseAuth.signInWithEmailAndPassword(email: 'demo@gmail.com', password: 'demo123').then((authResult){
                  setState(() {
                    firebaseUser = authResult.user;
                  });
                  print(firebaseUser.email);
                });
                    },
              color: logoGreen,
              child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              textColor: Colors.white,
            ),
            SizedBox(height: 20),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async{
                final GoogleSignInAccount googleUser = await googleSignIn.signIn();
                final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


                final AuthCredential credential = GoogleAuthProvider.credential(
                    idToken: googleAuth.idToken, accessToken: googleAuth.accessToken
                );

                final User user = (await firebaseAuth.signInWithCredential(credential)).user;
                //Here goes the logic for Google SignIn discussed in the next section
              },
              
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.google),
                  SizedBox(width: 10),
                  Text('Sign-in using Google',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 100),
            _buildFooterLogo()
          ],
        ),
      ),
    );
  }


  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/logo2.png',
          height: 40,
        ),

      ],
    );
  }



  buildTextField(String labelText, IconData icon){
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.deepPurpleAccent)),
      child: TextField(
        decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      icon: Icon(
      icon,
      color: Colors.white,
      ),
      // prefix: Icon(icon),
      border: InputBorder.none),
      ),
    );
  }
}
