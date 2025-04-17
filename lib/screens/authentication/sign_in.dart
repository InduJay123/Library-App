import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../constants/styles.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn({Key? key, required this.toggle}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/books/biography/w1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 195),
                  child: Form(
                    key: _formKey, //validate key
                    child: Column(
                      children: [
                      const Text(
                        'Inkspire',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color:kMainColor,
                          fontFamily: 'BlackAndWhite',
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const Text("SIGN IN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:25,fontWeight:
                            FontWeight.w900
                        ),),
                        const SizedBox(height: 30),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val?.isEmpty == true ? "Enter a valid email" : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration:
                              textInputDecoration.copyWith(hintText: "password"),
                          validator: (val) => val!.length < 6
                              ? "Password must be at least 6 characters"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        const SizedBox(height: 35),

                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              'assests/books/biography/goo2.jpeg',
                              height: 70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        //register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: kMainDarkBlue, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          //methode for login user
                          onTap: () async {
                            dynamic result = await _auth
                                .signInUsingEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = "Could not signin with those credentials";
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color:kMainDarkBlue,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: kMainDarkBlue)),
                            child: const Center(
                                child: Text(
                              "LOGIN",
                              style: TextStyle(
                                   color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //anon
                        GestureDetector(
                          //methode for login user as anon
                          onTap: () async {
                            await _auth.signInAnonymously();
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: kMainDarkBlue,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: kMainDarkBlue)),
                            child: const Center(
                              child: Text(
                                "LOGIN AS GUEST",
                                style: TextStyle(
                                    color: Colors.white,
                                  fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}