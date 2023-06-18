import 'package:prd/controller/ex_file.dart';

import 'package:prd/view/widgets/txtFF.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: pro.isDark? KAllBlack : AllWhite,
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
                            prefixIcon:  Icon(Icons.email_outlined ,color:pro.isDark?  AllWhite :KAllBlack),color:  pro.isDark?  AllWhite :KAllBlack  ,),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultTTF(
                          controller: passwordController,
                          label: 'Enter Your Password',
                          obscureText: true,
                          color:  pro.isDark?  AllWhite :KAllBlack ,
                          prefixIcon:  Icon(Icons.lock , color:pro.isDark?  AllWhite :KAllBlack),
                          suffixIcon: IconButton(
                            onPressed: () {
                            },
                            icon: true
                                ?  Icon(Icons.visibility_outlined ,color: pro.isDark?  AllWhite :KAllBlack,)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              bloc.login(emailController.text, passwordController.text,context);
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
                             Text('Don\'t have an account?',
                                style: TextStyle(
                                    fontSize: 18, color: pro.isDark ? AllWhite :KAllBlack )),
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
