import 'package:flutter/material.dart';

class FormAnimation extends StatefulWidget {
  const FormAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _FormAnimationState();
}

enum AuthMode { signUp, login }

class _FormAnimationState extends State<FormAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    if (_authMode == AuthMode.login) {
    } else {}
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthMode _authMode = AuthMode.login;

  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {"e_mail": "", "password": ""};

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 10,
          shadowColor: Colors.pinkAccent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            height: _authMode == AuthMode.signUp ? 320 : 260,
            curve: Curves.easeInCirc,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: "E_Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty || !val.contains("@")) {
                          return "Invalid E_Mail!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['password'] = val!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty || val.length < 5) {
                          return "Password Is Too Short!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        _authData["e_mail"] = val!;
                      },
                    ),
                    //if (_authMode == AuthMode.signUp)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      constraints: BoxConstraints(
                        maxHeight: _authMode == AuthMode.signUp ? 120 : 0,
                        minHeight: _authMode == AuthMode.signUp ? 60 : 0,
                      ),
                      child: FadeTransition(
                        opacity: _animation!,
                        child: TextFormField(
                          enabled: _authMode == AuthMode.signUp,
                          decoration: const InputDecoration(
                              labelText: "Confirm Password"),
                          obscureText: true,
                          validator: _authMode == AuthMode.signUp
                              ? (value) {
                                  if (value != _passwordController.text) {
                                    return "Password Don't Match!";
                                  }
                                  return null;
                                }
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.purpleAccent),
                          textStyle: const MaterialStatePropertyAll(
                            TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: _submit,
                        child: Text(
                            _authMode == AuthMode.login ? 'LOGIN' : 'SIGN UP')),
                    TextButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          )),
                      onPressed: _switchAuthMode,
                      child: Text(
                          "${_authMode == AuthMode.login ? "Sign Up" : "Login"} Instead"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
