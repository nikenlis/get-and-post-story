import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/register_controller.dart';
import 'package:tugas2_moa/routes/route_name.dart';
import 'package:tugas2_moa/shared/share_method.dart';
import 'package:tugas2_moa/shared/theme.dart';
import 'package:tugas2_moa/ui/widgets/bottons.dart';
import 'package:tugas2_moa/ui/widgets/form.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController _controller = Get.put(RegisterController());
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty||emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
           SizedBox(
            height: MediaQuery.of(context).size.height/4,
          ),
          Text(
            'Register to Your\nAccount',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// NOTE: NAME INPUT
                CustomFormField(
                  title: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: EMAIL INPUT
                CustomFormField(
                  title: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                CustomFormField(
                  title: 'Password',
                  obsecureText: true,
                  iconVisibility: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Register',
                  onPressed: () async {
                    if (validate()) {
                    await _controller.registerUser(nameController.text, emailController.text, passwordController.text);
                    } else {
                      showCustomSnackbar(context, 'Semua Field Harus diIsi');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButton(
            title: 'Already have an account? Login',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.login, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
