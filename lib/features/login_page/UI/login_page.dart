import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/features/dashboard/UI/dashboard.dart';
import 'package:flutter_bloc_application/features/login_page/bloc/login_page_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  final LoginPageBloc loginPageBloc = LoginPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocConsumer<LoginPageBloc, LoginPageState>(
        bloc: loginPageBloc,
        listener: (context, state) {
          if (state is LoginPageSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.success),
              shape: StadiumBorder(),
              backgroundColor: Colors.green,
            ));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          } else if (state is LoginPageFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              shape: StadiumBorder(),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 15,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15),
                          TextFormField(
                            // maxLength: 20,
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 1 ||
                                  value.trim().length > 20) {
                                return 'Must be between 1 & 20 characters';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: _obscureText,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              border: const UnderlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.remove_red_eye_sharp
                                      : Icons.visibility_off_sharp,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 7) {
                                return 'Minimum length of password should be 8';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Row(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => _formKey.currentState!.reset(),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black38),
                                child: Text('Reset'),
                              ),
                              state is LoginPageLoadingState
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          debugPrint(
                                              '${_usernameController.text} ${_passwordController.text}');
                                          loginPageBloc.add(
                                                LoginSubmitEvent(
                                                  username:
                                                      _usernameController.text,
                                                  password:
                                                      _passwordController.text,
                                                ),
                                              );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black38),
                                      child: Text('Login'),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
