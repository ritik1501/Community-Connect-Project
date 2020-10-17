import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
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
              Text('Requested Books')
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
                  Padding(padding: EdgeInsets.only(left: 10.0),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color:Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text("Didn't find your Book??",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color:Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Request here for your books...',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                              Text('We will try to make it available\n as soon as possible, Thanks!',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.all(0.0),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Book Name  : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Book Edition : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Book Author : ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                            Text('Requested By: ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Law of Physics',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0, fontWeight: FontWeight.w800)),
                            Text('Edition 1',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0, fontWeight: FontWeight.w800)),
                            Text('KK Menon',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0, fontWeight: FontWeight.w800)),
                            Text('Nilutpol Kashyap',style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 15.0, fontWeight: FontWeight.w800)),
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/book1.png'),
                          minRadius: 50.0,
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
