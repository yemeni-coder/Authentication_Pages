import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);


  @override
  State<Password> createState() => _PasswordState();
}



class _PasswordState extends State<Password> {
  TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _validateEmail(String value) {
    if (value.isEmpty || !value.contains('@')) {
      setState(() {
        _isEmailValid = false;
      });
    } else {
      setState(() {
        _isEmailValid = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
        ),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.password, color: Colors.black,),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!_isEmailValid) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onChanged: _validateEmail,
            ),
            const SizedBox(height: 24.0
            ),

            ElevatedButton(
              onPressed: _isEmailValid
                  ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Resetting your password...')),
                );
              }
                  : null,
              child: const Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                primary: Colors.black,


              ),
            ),
          ],
        ),
      ),
    );
  }
}