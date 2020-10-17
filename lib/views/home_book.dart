import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8c52ff),
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              Image.asset('assets/splash-image.png', fit: BoxFit.contain, height: 40),
              Padding(padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),),
              Text('Home')
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/cclogo.png', fit: BoxFit.contain, height: 100),
                  Padding(padding: EdgeInsets.only(left: 30.0),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color:Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text('Welcome in Book ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                              Text('Donation Application',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color:Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text('Help India in becoming the most',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                              Text('educated country in the world',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Card(
                    color: Colors.blueAccent,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/book1.png'),
                          minRadius: 50.0,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10.0),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Book Name  : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Book Edition : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Book Author : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Donated By : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Law of Physics',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0)),
                            Text('Edition 1',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0)),
                            Text('KK Menon',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0)),
                            Text('Nilutpol Kashyap',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
