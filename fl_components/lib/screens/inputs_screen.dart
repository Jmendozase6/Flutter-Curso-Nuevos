import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Jhin',
      'last_name': 'Wright',
      'email': 'jhin@gmail.com',
      'password': '123456',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs & Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                    labelText: 'Name',
                    hintText: 'User first Name',
                    formProperty: 'first_name',
                    formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Lastname',
                    hintText: 'Last name',
                    formProperty: 'last_name',
                    formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Email',
                    hintText: 'User email',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Password',
                    hintText: 'User password',
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'SuperUser', child: Text('SuperUser')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr Developer', child: Text('Jr Developer')),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Center(child: Text('Save')),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('Invalid form');
                      return;
                    }

                    print(formValues);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
