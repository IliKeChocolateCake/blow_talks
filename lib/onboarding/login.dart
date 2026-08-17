
import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/onboarding/forgot_password.dart';
import 'package:blow_talks/widget/main_navigation.dart';
import 'package:flutter/material.dart';




class Login extends StatefulWidget{

  const Login ({super.key});

  @override
  State<Login> createState() => LoginPage();

}


class LoginPage  extends State<Login>{

  bool _isVisible=false;
  // Add controllers at the top of your State class
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppGrey.light50,
      
      body: Padding(padding: EdgeInsets.all(20),
      
        child: Column(
          mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 32,),

            Image.asset('asset/logo.png', height: 50, width: 50),


            SizedBox(height: 20,),

            Text('Log in to blowtalks', style: text24Bold,),



            
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                
                Text('Don\'t have an account?'),
                TextButton(onPressed: (){}, child: Text('Create an account.', style: text14Regular.copyWith(color: brandColor),))
              ],
            ),
            
            SizedBox(height: 32,),
            
            Text('Email Address', style: text12Regular.copyWith(color: AppGrey.light600),),


            const SizedBox(height: 4),
            TextField(

              controller: _emailController,
              decoration: InputDecoration(

                hintText: 'Enter your email',
                filled: true,
                fillColor: AppGrey.lightInputBg,
                hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                labelStyle: text14Regular,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
              ),
            ),

            const SizedBox(height: 12,),
            Text('Password', style: text12Regular.copyWith(color: AppGrey.light600),),


            const SizedBox(height: 4),
            TextField(

              controller: _passwordController,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                filled: true,
                fillColor: AppGrey.lightInputBg,
                hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? const Icon(Icons.visibility_outlined, color: AppGrey.light300,)
                      : const Icon(Icons.visibility_off_outlined,  color: AppGrey.light300,),
                ),
                labelStyle: text14Regular,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
              ),
            ),

            //isDarkMode(context)
            const SizedBox(height: 12,),
            
            TextButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPassword()),
              );

            }, child: Text('Forgot Password?', style: text12Regular.copyWith(color: AppGrey.light500),)),

            SizedBox(height: 24,),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();

                  // Member credentials
                  if (email == 'member@test.com' && password == 'member123') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const Navigation(role: 'member', initialIndex: 0,)),
                    );

                    // Creator credentials
                  } else if (email == 'creator@test.com' && password == 'creator123') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const Navigation(role: 'creator', initialIndex: 0,)),
                    );

                    // Wrong credentials
                  } else {
                    setState(() => _errorMessage = 'Invalid email or password.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
                child: Text('Sign In', style: text14Regular),
              ),
            ),

// Show error message below button
            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: text12Regular.copyWith(color: Colors.red),
              ),
            ],
            SizedBox(height: 16,),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'OR',
                    style: text14Regular.copyWith(color: AppGrey.light400),
                  ),
                ),

                Expanded(
                  child: Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16,),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: Image.asset('asset/icon/login/google.png', height: 16, width: 16,),
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppGrey.light50, // brandColor 500
                  side: BorderSide(color: AppGrey.light300, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
             label: Text(
               'Sign in with Google',
               style: text14Regular.copyWith(color: AppGrey.light500),
             ),

              ),
            ),

            SizedBox( height: 12,),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: Image.asset('asset/icon/login/yahoo.png', height: 16, width: 16,),
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppGrey.light50, // brandColor 500

                  side: BorderSide(color: AppGrey.light300, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
                label: Text(
                  'Sign in with YahooMail',
                  style: text14Regular.copyWith(color: AppGrey.light500),
                ),

              ),
            ),

            SizedBox(height: 20,),


            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('By signing in, you are agreeing to our Terms of Use and Privacy Policy', textAlign: TextAlign.center, style: text12Regular.copyWith(color: AppGrey.light400),),
              ],
            ),

          ],
        ),
      ),



    );
  }


}