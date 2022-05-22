import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yildizlar/src/core/services/auth_service.dart';
import 'login_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI with fadeOut animation',
      home: RegisterPage(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  late bool _success;
  late String _message;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
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
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      Color.fromARGB(255, 220, 151, 251),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Image.asset(
                            "assets/images/gamepad.png",
                           height: size.width * 0.20,
                              width: size.height * 0.20,
                          ),
                          component1(_emailController, "E-mail...",
                              Icons.email_outlined, 'Email...', false, true),
                          Container(
                            height: size.width / 8,
                            width: size.width / 1.22,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: size.width / 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8)),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.purple.withOpacity(.7),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  labelText: "Password...",
                                  labelStyle:
                                      const TextStyle(color: Colors.purple),
                                  border: const OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Boş bırakmayınız";
                                }
                                if (value != _passwordConfirmController.text) {
                                  return "Şifreler eşleşmiyor";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            height: size.width / 8,
                            width: size.width / 1.22,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: size.width / 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: _passwordConfirmController,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8)),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.purple.withOpacity(.7),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  labelText: "Password...",
                                  labelStyle:
                                      const TextStyle(color: Colors.purple),
                                  border: const OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Boş bırakmayınız";
                                }
                                if (value != _passwordController.text) {
                                  return "Şifreler eşleşmiyor";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:  EdgeInsets.symmetric(
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
                                    "Login",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      AuthenticationService(_auth).signUp(_emailController.text,_passwordController.text);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:  EdgeInsets.symmetric(
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

  Widget component1(controller, String y, IconData icon, String hintText,
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

  // void _register() async {
  //   try {
  //     final User? user = (await _auth.createUserWithEmailAndPassword(
  //             email: _emailController.text, password: _passwordController.text))
  //         .user;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Kayıt Başarılı Merhaba ${user?.email}")));

  //     if (user != null) {
  //       setState(() {
  //       _message = "Merhaba, ${user.uid}";
  //       _success = true;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(_message)));
  //       });
  //     } else {
  //       setState(() {
  //       _message = "Hata oldu";
  //       _success = true;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(_message)));
  //       });
  //     }
  //   } on FirebaseAuthException catch (er) {
  //     setState(() {
  //     _message = er.message!;
  //     _success = false;
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(_message)));
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
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
