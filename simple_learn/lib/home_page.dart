import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final List<Image> myImage =[
    const Image(
      image: AssetImage('assets/image1.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image2.jpg'),
      fit: BoxFit.cover,

    ),
    Image(
      image: AssetImage('assets/image3.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image4.jpg'),
      fit:BoxFit.cover,

    ),
    Image(
      image: AssetImage('assets/image5.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image6.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image7.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image2.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image3.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image5.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image4.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image7.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image1.jpg'),
      fit:BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/image2.jpg'),
      fit:BoxFit.cover,
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: Text('Your Home'),
          actions: <Widget>[
            MaterialButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              color:Colors.blue,
              child: Text(
                  'sign out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              Container(

                  child: GridView.count(
                      crossAxisCount: 3,
                      children:[...myImage]
                  ),
                height: 600,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 150,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:[...myImage]
                  )
              ),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
              // Text("Teest"),
            ],
          ),
        ),
      )


    );
  }
}






















