import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constants/colors.dart';
import '../../constants/description.dart';
import '../../constants/styles.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  //from key
  final _formKey = GlobalKey<FormState>();
  //email password states
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                  padding: const EdgeInsets.only(top: 55,bottom: 320),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text("REGISTER",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:25,fontWeight:
                              FontWeight.w900
                          ),),
                        SizedBox(height: 70,),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val!.isEmpty ? "Enter a valid email" : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        //password
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration:
                              textInputDecoration.copyWith(hintText: "Password"),
                          validator: (val) => val!.length < 6
                              ? "Password must be at least 6 characters"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        //google
                        const SizedBox(height: 20),
                        //error text
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        const Text(
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          //sing in with google
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              'assests/books/biography/goo2.jpeg',
                              height: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
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
                              //go to the signin page
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: kMainDarkBlue, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),

                        //button
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          //methode for login user
                          onTap: () async {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              //error
                              setState(() {
                                error = "please enter a valid email!";
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
                              "REGISTER",
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