import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _State();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Signup Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter mail',
                          prefixIcon: Icon(Icons.email_sharp),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Enter Email PLS':null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter password',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Enter password PLS':null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm password',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Enter password PLS':null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), //apply padding horizontal or vertical only

                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: (){},
                          child: Text("Login"),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      )
                    ],

                  )
              ),
            )

          ],

        ),
      ),
    );
  }
}

