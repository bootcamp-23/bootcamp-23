import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yildizlar/src/core/services/auth_service.dart';
import 'package:yildizlar/src/view/home/home.dart';


import 'forgot_password_page.dart';
import 'register_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI with fadeOut animation',
      home: LoginPage(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _h = size.height;
    double _w = size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 219, 151, 251),
                    Color.fromARGB(255, 65, 26, 82),
                  ],
                ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width * .9,
                    height: size.width * 1.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            child: Image.asset(
                              "assets/images/gamepad.png",
                              height: _w * 0.20,
                              width: _h * 0.20,
                            ),
                          ),
                          holder(_emailController, "E-mail",
                              Icons.email_outlined, 'Email...', false, true),
                         
                          Padding(
                            padding: const EdgeInsets.only(left: 4,top: 10.0),
                            child: holder(_passwordController, "Password",
                                Icons.lock_outline, 'Password...', true, false),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        AuthenticationService(_auth).signIn(
                                            _emailController.text,
                                            _passwordController.text);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()));
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.020),
                                      primary:
                                          const Color.fromARGB(255, 179, 106, 214),
                                      elevation: 20,
                                      shadowColor: Colors.purple),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.020),
                                      primary:
                                          Color.fromARGB(255, 179, 106, 214),
                                      elevation: 20,
                                      shadowColor: Colors.purple),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                          const SizedBox(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ));
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              AuthenticationService(_auth).signGuest();
                            },
                            child: const Text(
                              "Guest Login",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget holder(controller, String y, IconData icon, String hintText,
      bool isPassword, bool isUsername) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType:
            isUsername ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.purple.withOpacity(.7),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
            labelText: y,
            labelStyle: const TextStyle(color: Colors.purple),
            border: const OutlineInputBorder()),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Boş bırakmayınız";
          } else {
            return null;
          }
        },
      ),
    );
  }

  // void _signIn() async {
  //   try {
  //     final UserCredential userCredential =
  //         await _auth.signInWithEmailAndPassword(
  //             email: _emailController.text, password: _passwordController.text);
  //     final User? user = userCredential.user;

  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Hoşgeldin ${user?.email}")));
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Home()));
  //   } on FirebaseAuthException catch (er) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(er.toString())));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //       e.toString(),
  //     )));
  //     debugPrint(e.toString());
  //   }
  // }

  // void _signInAnonymously() async {
  //   await _auth.signInAnonymously();
  //   Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Home()));
  // }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
