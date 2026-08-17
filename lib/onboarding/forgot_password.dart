import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/onboarding/enter_code.dart';
import 'package:flutter/material.dart';





class ForgotPassword extends StatefulWidget{

  const ForgotPassword ({super.key});



  @override
  State<ForgotPassword> createState() => ForgotPasswordPage();



}


class ForgotPasswordPage extends State<ForgotPassword>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(

    backgroundColor: AppGrey.light50,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () { Navigator.pop(context); },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
            ),
          ),
        ),
      ),


    ),


    body: Padding(padding: EdgeInsets.all(20),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 40,),
          Center(

            child: Text('Forgot Password', textAlign: TextAlign.center, style: text24Bold,),
          ),

          SizedBox(height: 8,),

          Text('Please provide your email address, and we will send you a code to reset your password.', textAlign: TextAlign.center, style: text14Regular.copyWith(color: AppGrey.light500),),

          SizedBox(height: 45,),

          Text('Email Address', style: text12Regular.copyWith(color: AppGrey.light600),),


          const SizedBox(height: 4),
          TextField(

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

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EnterCode()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: brandColor, // brandColor 500
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                elevation: 0,
              ),
              child: Text(
                'Continue',
                style: text14Regular,
              ),
            ),
          ),


        ],
      ),

    ),



  );
  }



}