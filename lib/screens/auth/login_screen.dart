// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/screens/auth/reset_password_screen.dart';
import 'package:ms_ecommerce_app/screens/auth/signup_screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../services/global_methods.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/Login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _chanageVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  bool _isVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  final GlobalMethods _globalMethods = GlobalMethods();

  void _submitData() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
    }
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: _email.toLowerCase().trim(), password: _password)
          .then((value) =>
              Navigator.canPop(context) ? Navigator.pop(context) : null);
    } catch (error) {
      _globalMethods.authDialog(context, error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  Colors.orangeAccent,
                  Colors.tealAccent,
                  Colors.pinkAccent,
                  Colors.deepPurpleAccent,
                ],
                durations: [35000, 11000, 10800, 6000],
                heightPercentages: [0.01, 0.02, 0.03, 0.1],
                blur: const MaskFilter.blur(BlurStyle.solid, 0),
              ),
              heightPercentage: 0.2,
              size: const Size(double.infinity, double.infinity),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 65),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      onSaved: (value) {
                        _email = value!;
                      },
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      focusNode: _passwordFocusNode,
                      onSaved: (value) {
                        _password = value!;
                      },
                      onEditingComplete: _submitData,
                      obscureText: _isVisible,
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must be atleast 8 units';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: Icon(_isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: _submitData,
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ResetPasswordScreen.routeName);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignupScreen.routeName);
                  },
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
