import 'package:flutter/material.dart';
import '../controllers/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfff8f3f1),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),

            child: Column(
              children: [

                const SizedBox(height: 50),

                const Icon(
                  Icons.person_add_alt_1,
                  size: 70,
                  color: Colors.brown,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Register to continue",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // EMAIL
                TextField(
                  controller: _emailController,

                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,

                    contentPadding:
                        const EdgeInsets.all(18),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // PASSWORD
                TextField(
                  controller: _passwordController,
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,

                    contentPadding:
                        const EdgeInsets.all(18),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // SIGNUP BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 56,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xffefe2db),

                      foregroundColor:
                          Colors.brown,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                           BorderRadius.circular(30),
                      ),
                    ),

                    onPressed: () {

                      AuthService()
                          .createAccount(
                            _emailController.text,
                            _passwordController.text,
                          )
                          .then((value) {

                        if(value=="Account Created"){

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                               "Account Created Successfully!",
                              ),
                            ),
                          );

                          Navigator.pop(context);
                        }

                        else{

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(value),
                            ),
                          );

                        }

                      });

                    },

                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                      const Size(double.infinity,56),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),

                  onPressed: (){
                    Navigator.pop(context);
                  },

                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.brown,
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