import 'package:flutter/material.dart';
import 'package:vibrona/common/widgets/appbar/basic_appbar.dart';
import 'package:vibrona/common/widgets/button/basic_app_button.dart';
import 'package:vibrona/common/widgets/textFields/basic_text_field.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/data/models/auth/signin_user_req.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/presentation/auth/pages/sign_up_page.dart';
import 'package:vibrona/presentation/root/pages/root_page.dart';
import 'package:vibrona/service_lecator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isobscure = true;
  String? email;
  String? password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        widget: Center(child: Image.asset(AssetsImages.assetsImagesAppBarLogo)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            BasicTextField(
              controller: _emailController,
              onChanged: (value) {
                email = value;
              },
              text: 'Enter user name or email',
              icon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 24),
            BasicTextField(
              controller: _passwordController,
              onChanged: (value) {
                password = value;
              },
              isobscure: isobscure,
              text: 'Enter password',
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                icon: Icon(
                  isobscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
            const SizedBox(height: 40),
            BasicAppButton(
              text: 'Sign in',
              onPressed: () async {
                final result = await sl<AuthRepo>().signIn(
                  SigninUserReq(email: email!, password: password!),
                );
                result.fold(
                  (l) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l)));
                  },
                  (r) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(r)));
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const RootPage()),
                      (route) => false,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 120),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not A Member?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
