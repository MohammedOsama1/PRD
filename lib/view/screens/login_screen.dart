import 'package:prd/controller/ex_file.dart';

import 'package:prd/view/widgets/txtFF.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/giphy.gif'))
        ),

        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children:[
                  Stack(
                    children: [
                      Image.asset('assets/w.gif'),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text('    Welcome back',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
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
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LayoutScreen()), (route) => false);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
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
                                    fontSize: 18, color: Colors.black54)),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(' Register',
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
      ),
    );
  }
}
