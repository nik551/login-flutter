import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';

class LogInPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LogInPage({super.key, required this.showRegisterPage});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _obscureText = true;
  String _errorMessage = '';
  String _errorPassword  = '';
  //text controllers
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    print("dispose activated");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email'
              ),
              onChanged: (val){
                validateEmail(val);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errorMessage, style: const TextStyle(color: Colors.red),),
            ),

            //password
            TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });

                      },
                      child: Icon(_obscureText ? Icons.visibility:Icons.visibility_off),
                    ),
                    labelText: 'Password'
                ),
                obscureText: _obscureText,
                onChanged: (val){
                  validatePassword(val);
                }
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errorPassword, style: const TextStyle(color: Colors.red),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  height: 30,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                        'Login',
                      style: TextStyle(color: Colors.white),

                    ),
                  ),
                ),
              ),
            ),




            Row(
              children: [
                const Text(
                  "Create new user",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.blue,

                    ),


                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }
  void validatePassword(String val){
    if (val.isEmpty){
      setState(() {
        _errorPassword="password can not be empty";
      });
    }
    if(val.length<8){
      setState(() {
        _errorPassword="Password must be min 8";
      });
    }
    else{
      setState(() {
        _errorPassword="";
      });

    }
  }
}