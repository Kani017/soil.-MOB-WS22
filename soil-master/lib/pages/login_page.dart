


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.green[100],

      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg2.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //logo image
              Image(
                image: AssetImage("images/icon2.png"),
              ),
              SizedBox(height: 10),
              // "soil." title
              Image(
                image: AssetImage("images/soil.png"),
              ),

              SizedBox(height: 15),
              Text(
                'Your plantcare NILS TEST solution',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                 color: Color(0xFF1F312B)
                ),
              ),
              SizedBox(height: 130),

              //Email Textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFAFCEBF),
                    border: Border.all(color: Color(0xFF1F312B)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      style: TextStyle(fontSize: 17),
                      controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //password section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFAFCEBF),
                    border: Border.all(color: Color(0xFF1F312B)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      style: TextStyle(fontSize: 17),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF24362D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              //not a member?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 50.0,
                          color: Colors.black,
                        ),
                      ],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      ' Register now!',
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 50.0,
                            color: Colors.black,
                          ),
                        ],
                        fontSize: 18,
                        color: Colors.cyan,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 140),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
