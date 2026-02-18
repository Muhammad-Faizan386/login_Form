import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle textFieldStyle() {
    return TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500);
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordRevealed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign-in',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30,
                            top: 20,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (emailString) {
                              if (emailString == null ||
                                  emailString.isEmpty ||
                                  !emailString.contains('@')) {
                                return "Please enter a valid Email address";
                              }
                              return null;
                            },
                            style: textFieldStyle(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12.0),
                              errorStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: 'email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        SizedBox(height: 8),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (passwordString) {
                              if (passwordString == null ||
                                  passwordString.isEmpty) {
                                return "Please enter a valid password";
                              }
                              if (passwordString.length < 6) {
                                return 'Please enter stronger password';
                              }
                              return null;
                            },
                            style: textFieldStyle(),
                            obscureText: !passwordRevealed,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12.0),
                              errorStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '1234@',
                              suffixIcon: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  setState(() {
                                    passwordRevealed = !passwordRevealed;
                                  });
                                },
                                icon: Icon(
                                  (passwordRevealed == false
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined),
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 17.0,
                            right: 17.0,
                            top: 25,
                          ),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();
                              }
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Forgot your password?',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                          ),
                          child: InkWell(
                            child: Card(
                              elevation: 4,
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Create new account',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
