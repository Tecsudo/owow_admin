import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/core/extensions/responsive_framwork.dart';

import 'package:responsive_framework/responsive_framework.dart';

import '../../../config/router/route_name.dart';
import '../../provider/auth.dart';
import '../common/background.dart';
import '../common/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authenticationFormKey = GlobalKey<FormState>();

  bool _obscureText = true;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isValidEmail(String input) {
    bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);

    return isEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 32,
          rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
          layout: context.isDisplayLargeThanDesktop
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 5,
              columnOrder: 1,
              child: _leftLayout(context),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 4,
              columnOrder: 2,
              child: _rightLayout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 500,
        minHeight: 400,
        minWidth: 400,
      ),
      child: Image.asset(
        'assets/images/auth.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _leftLayout(BuildContext context) {
    return Form(
      key: _authenticationFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 450,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'user@exapmle.com',
                        helperText: 'username',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _passwordController,
                      enableSuggestions: false,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(
                            !_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: '********',
                        helperText: 'Password',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: <Widget>[
                //     const Text('Forgot Password? '),
                //     TextButton(
                //       child: const Text(
                //         'Click Here',
                //       ),
                //       onPressed: () {
                //         //TODO: Implement Forgot Password
                //       },
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          CustomGradientElevatedButton(
            minimumSize: const Size(313, 60),
            buttonText: Text(
              'Continue',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              if (_authenticationFormKey.currentState!.validate()) {
                _authenticationFormKey.currentState!.save();
                auth(
                  password: _passwordController.text,
                  username: _usernameController.text,
                ).then((value) {
                  if (value == 200) {
                    context.goNamed(RouteNames.home.name);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Invalid Credentials',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
