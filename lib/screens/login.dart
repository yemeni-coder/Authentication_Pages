import 'package:assignment_1/screens/forgot_password.dart';
import 'package:assignment_1/screens/home_page.dart';
import 'package:assignment_1/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

String? email;
String? password;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: <Widget>[


              const SizedBox(height: 50),



              const   Icon(
                Icons.account_box, // Add your icon here
                size: 200,
                color: Colors.black,
              ),



              const SizedBox(height: 30),

              const   Text('Sing In', style:
              TextStyle(color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),

              const SizedBox(height: 10),

              /*

              This code for adding an image but it shows that something is wrong with my pubspec.yaml which I
              already fixed but still not working.

          Image.asset('assets/images/m.png',
          width:
          height:
          ),
          const SizedBox(height:70),

           */


              // the beginning of the textField ----------------------------------------




              //  for Email
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a valid email  ',
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Colors.black,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  // Check if email input is not empty and matches email format
                  if (value.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    email = value;
                  } else {
                    email = null;
                  }
                },
              ),



              const SizedBox(height: 20),


              // for Password
              TextField(
                decoration: InputDecoration(
                  hintText: 'enter a valid password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.password, color: Colors.black,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                ),
                obscureText: true,
                onChanged: (value) {
                  // Check if password input is not empty and has at least 6 characters
                  if (value.isNotEmpty && value.length >= 6) {
                    password = value;
                  } else {
                    password = null;
                  }
                },
              ),



              const SizedBox(height: 30),



// Submit button with validation
              MaterialButton(
                elevation: 5.0,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 100,
                ),
                child: const Text('Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),

/*

to show a SnackBar

      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signing up...')),
          );
        }
      },
    */

                onPressed: () {
                  if (email != null && password != null) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }
                },
              ),




              // the end of the text -----------------------------------------------------------


              const SizedBox(height: 20),




              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const Password();
                  }));

                },
                child: const Text('Forgot Password',
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),


              const SizedBox(height: 20),


              GestureDetector(
                onTap: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const SignUp();
                  }));

                },
                child: const Text('Sign Up',
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}