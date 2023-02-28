import 'package:flutter/material.dart';

import 'package:prd/view/widgets/txtFF.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children:[
                Image.asset('assets/w.gif'),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
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
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            // LoginCubit.get(context).hidePassword();
                          },
                          icon: true
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            // LoginCubit.get(context).userLogin(
                            //     emailController.text,
                            //     passwordController.text);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54)),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(' Register Now',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.blueAccent)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),

            ],
          ),
        ),
      ),
    );
  }
}
