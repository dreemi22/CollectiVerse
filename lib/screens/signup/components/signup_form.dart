// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:collectiverse/screens/signin/signin.dart';
import 'package:flutter/material.dart';

class Signup_form extends StatefulWidget {
  const Signup_form({super.key});

  @override
  State<Signup_form> createState() => _Signup_formState();
}

class _Signup_formState extends State<Signup_form> {
  late String email;
  late String password;
  late String confirm_password;
  late String username;
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Enter your Username',
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            buildUsernameFormField(),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Enter your Email',
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            buildEmailFormField(),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Enter your Password',
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            buildPasswordFormField(),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Confirm your Password',
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            buildConfirmPasswordFormField(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {}
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123035),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Color(0xFFC6E7ED), fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Already an user?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const signin();
                    },
                  ));
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue!,
      style: const TextStyle(color: Color(0xFF123035), fontSize: 20),
      cursorColor: const Color(0xFF123035),
      cursorWidth: 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF95B5BB),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
      ),
      validator: (args) {
        if (args!.isEmpty) {
          return 'This field is required';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirm_passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      style: const TextStyle(color: Color(0xFF123035), fontSize: 20),
      cursorColor: const Color(0xFF123035),
      cursorWidth: 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF95B5BB),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xFF95B5BB),
          ),
        ),
      ),
      validator: (args) {
        if (args!.isEmpty) {
          return 'This field is required';
        // ignore: prefer_is_empty
        } else if (confirm_passwordController.text.length > 0 &&
            confirm_passwordController.text.length < 6) {
          return 'Enter atleast 6 character password';
        } else if (passwordController.text != confirm_passwordController.text) {
          return "Enter valid password";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      style: const TextStyle(color: Color(0xFF123035), fontSize: 20),
      cursorColor: const Color(0xFF123035),
      cursorWidth: 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF95B5BB),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
      ),
      validator: (args) {
        if (args!.isEmpty) {
          return "This field is required";
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(args)) {
          return "Enter valid email";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      style: const TextStyle(color: Color(0xFF123035), fontSize: 20),
      cursorColor: const Color(0xFF123035),
      cursorWidth: 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF95B5BB),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF95B5BB),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xFF95B5BB),
          ),
        ),
      ),
      validator: (args) {
        if (args!.isEmpty) {
          return 'This field is required';
        // ignore: prefer_is_empty
        } else if (passwordController.text.length > 0 &&
            passwordController.text.length < 6) {
          return 'Enter atleast 6 character password';
        } else {
          return null;
        }
      },
    );
  }
}
