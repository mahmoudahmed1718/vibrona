import 'package:flutter/material.dart';
import 'package:vibrona/common/widgets/appbar/basic_appbar.dart';
import 'package:vibrona/common/widgets/button/basic_app_button.dart';
import 'package:vibrona/common/widgets/textFields/basic_text_field.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/presentation/auth/pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isobscure = true;
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
            const SizedBox(height: 80),
            Center(
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),

            BasicTextField(text: 'Name', icon: Icon(Icons.person_outlined)),
            const SizedBox(height: 24),
            BasicTextField(
              text: 'Enter user name or email',
              icon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 24),
            BasicTextField(
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
            BasicAppButton(text: 'Sign Up', onPressed: () {}),
            const SizedBox(height: 80),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
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
