import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Email
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                  ),

                  //Senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),

                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
