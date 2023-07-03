import 'package:prd/controller/ex_file.dart';
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
    final pro = Provider.of<MyProvider>(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: KColor,
        title: Text('Register Screen'),
      ),
        backgroundColor: pro.isDark? KAllBlack : AllWhite,

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(''))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.network('https://th.bing.com/th/id/R.c1dbed646fb7a5f19f3ed5b31bda4795?rik=nS7EYfg2GZtN0w&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f5%2fMarketplace-PNG-Photos.png&ehk=poKar5IK1DGGkP8WwG1%2fUmAGXxRIeP%2fffZuTImkeaPk%3d&risl=&pid=ImgRaw&r=0',height: 300,),
                  DefaultTTF(
                  color:pro.isDark?  AllWhite :KAllBlack,
                      controller: nameController,
                      label: 'Enter Your Name',
                      prefixIcon:
                       Icon(Icons.verified_user_outlined ,color:pro.isDark?  AllWhite :KAllBlack,)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                    color:pro.isDark?  AllWhite :KAllBlack,
                    controller: phoneController,
                    label: 'Enter Your Phone',
                    prefixIcon:  Icon(Icons.phone,color:pro.isDark?  AllWhite :KAllBlack,),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                      color:pro.isDark?  AllWhite :KAllBlack,
                      controller: emailController,
                      label: 'Enter Your Email',
                      prefixIcon:  Icon(Icons.email_outlined,color:pro.isDark?  AllWhite :KAllBlack,)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTTF(
                    color:pro.isDark?  AllWhite :KAllBlack,
                    controller: passwordController,
                    obscureText: pro.passwordState ? true :false,

                    label: 'Enter Your Password',
                    prefixIcon:  Icon(Icons.lock,color:pro.isDark?  AllWhite :KAllBlack,),
                    suffixIcon: IconButton(
                      onPressed: () {
                        pro.showPassword();

                      },
                      icon: !pro.passwordState ?  Icon(Icons.visibility_outlined ,color: Colors.grey,) : const Icon(Icons.visibility_off_outlined,color: Colors.grey,),

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