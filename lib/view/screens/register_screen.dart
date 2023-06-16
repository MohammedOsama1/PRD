import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:prd/view/theme.dart';
import 'package:prd/view/widgets/txtFF.dart';

import '../widgets/ddbutton.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor,
        title: Text('Register Screen'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/giphy.gif'))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/1.jpeg',height: 300,),
                  DefaultTTF(
                      controller: nameController,
                      label: 'Enter Your Name',
                      prefixIcon:
                      const Icon(Icons.verified_user_outlined)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                    controller: phoneController,
                    label: 'Enter Your Phone',
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                      controller: emailController,
                      label: 'Enter Your Email',
                      prefixIcon: const Icon(Icons.email_outlined)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                    controller: passwordController,
                    label: 'Enter Your Password',
                    // obscureText: LoginCubit.get(context).showPassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // LoginCubit.get(context).hidePassword();
                      },
                      icon: const Icon(Icons.visibility_outlined)

                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          bloc.register(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            phoneController.text,
                            context
                          );
                        }
                      },
                      label: 'Register')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}