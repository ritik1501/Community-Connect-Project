import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'services/crud.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String bookName;
  String bookAuthor;
  String bookEdition;
  String bookRequest;
  QuerySnapshot books;

  crudeMethods crudObj = new crudeMethods();

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Request Book', style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the name of the book:',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    this.bookName = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the author of the book:',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    this.bookAuthor = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the edition of the book:',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    this.bookEdition = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Requested By:(Please Enter your Name)',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    this.bookRequest = value;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Request'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  Map bookData = {
                    'bookName': this.bookName,
                    'bookAuthor': this.bookAuthor,
                    'bookEdition': this.bookEdition,
                    'bookRequest': this.bookRequest
                  };
                  crudObj.addData(bookData).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Done', style: TextStyle(fontSize: 15.0)),
            content: Text('Requested!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        books = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('Requested Books'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              crudObj.getData().then((results) {
                setState(() {
                  books = results;
                });
              });
            },
          )
        ]),
        body: _bookList());
  }

  Widget _bookList() {
    if (books != null) {
      return ListView.builder(
        itemCount: books.docs.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) => Card(
          child: Card(
            color: Colors.blueAccent,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/book1.png'),
                  minRadius: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Book Name: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                    Text('Book Edition: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                    Text('Book Author: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                    Text('Requested By: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(books.docs[i].data()['bookName'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0)),
                    Text(books.docs[i].data()['bookEdition'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0)),
                    Text(books.docs[i].data()['bookAuthor'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0)),
                    Text(books.docs[i].data()['bookRequest'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Text('OOPS!! No Result Found.....',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 30.0));
    }
  }
}
// return new ListTile(
// title: Text(books.docs[i].data()['bookName']),
// subtitle: Text(books.docs[i].data()['bookAuthor']),
// // subtitle: Text(books.docs[i].data()['bookEdition']),
// // subtitle: Text(books.docs[i].data()['color']),
// );
