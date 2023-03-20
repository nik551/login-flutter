import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  String _errorMessage = '';
  String _errorPassword  = '';
  String _errorConfirmPassword = '';
  //text controllers
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  final _confirmpasswordController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Future signUp() async{
    if (!passwordConfirmed()){
      setState(() {
        _errorConfirmPassword='Enter correct confirm password';
      });
    }
    else if(passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
      );

    }
  }
  bool passwordConfirmed(){
    if(_passwordController.text.trim()==_confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Page'),
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
            //confirm password
            TextFormField(
                controller: _confirmpasswordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obscureText2=!_obscureText2;
                        });

                      },
                      child: Icon(_obscureText2 ? Icons.visibility:Icons.visibility_off),
                    ),
                    labelText: 'Confirm Password'
                ),
                obscureText: _obscureText2,
                onChanged: (val){
                  validatePassword2(val);
                }
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errorConfirmPassword, style: const TextStyle(color: Colors.red),),
            ),




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: signUp,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  height: 30,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),

                    ),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                const Text(
                  "Existing user",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),

                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: const Text(
                    'SignIn',
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
  void validatePassword2(String val){
    if (val.isEmpty){
      setState(() {
        _errorConfirmPassword="password can not be empty";
      });
    }
    if(val.length<8){
      setState(() {
        _errorConfirmPassword="Password must be min 8";
      });
    }
    else{
      setState(() {
        _errorConfirmPassword="";
      });

    }

  }
}
