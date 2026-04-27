import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../controllers/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // EMAIL
                TextField(
                  controller: emailController,
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
                  controller: passwordController,
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

                const SizedBox(height: 18),

                // LOGIN BUTTON
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
                          .login(
                            emailController.text,
                            passwordController.text,
                          )
                          .then((value) {

                        if(value=="Login Successful"){
                          Navigator.pushReplacementNamed(
                            context,
                            "/home",
                          );
                        }
                      });
                    },

                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // GOOGLE BUTTON
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                      const Size(double.infinity,56),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),

                  icon: const Icon(Icons.g_mobiledata,
                      size:30),

                  label: const Text(
                    "Continue with Google",
                  ),

                  onPressed: (){
                    AuthService()
                        .signInWithGoogle()
                        .then((_) {
                      Navigator.pushReplacementNamed(
                        context,
                        "/home",
                      );
                    });
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Don't have an account? ",
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                            context,
                            "/signup");
                      },

                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}