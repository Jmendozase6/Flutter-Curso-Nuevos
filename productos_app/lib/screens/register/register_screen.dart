import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/screens/screens.dart';

import 'package:productos_app/theme/app_theme.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Create new account',
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, LoginScreen.routeName),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginFormProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              labelText: 'Email',
              hintText: 'example@gmail.com',
              prefixIcon: Icons.alternate_email,
            ),
            onChanged: (value) => loginFormProvider.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Please enter a valid email';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              labelText: 'Password',
              hintText: '********',
              prefixIcon: Icons.lock,
            ),
            onChanged: (value) => loginFormProvider.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Password must be at least 6 characters';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: AppTheme.primaryColor,
            onPressed: loginFormProvider.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    if (!loginFormProvider.isValidForm()) return;

                    loginFormProvider.isLoading = true;

                    final String? errorMessage = await authService.createUser(
                        loginFormProvider.email, loginFormProvider.password);

                    if (errorMessage == null) {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    } else {
                      // TODO: Mostrar error en pantalla
                      print(errorMessage);
                      loginFormProvider.isLoading = false;
                    }
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginFormProvider.isLoading ? 'Loading...' : 'Login',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
