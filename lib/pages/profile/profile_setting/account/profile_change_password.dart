import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/account.dart';
import 'package:flutter/material.dart';



class ProfileChangePassword extends StatefulWidget{

  const ProfileChangePassword ({super.key});

  @override
  State<ProfileChangePassword> createState() => ProfileChangePasswordPage();


}


class ProfileChangePasswordPage extends State<ProfileChangePassword>{

  bool _isVisible=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: SafeArea(

          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(

          gradient: AppGradients.lightBackground,
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Account()),
                    );

                      },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
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

                  Expanded(
                    child: Center(
                      child: Text('Change Password', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: brandColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.check,
                            color: Colors.white, size: 24),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Text('Old Password', style: text12Regular.copyWith(color: AppGrey.light600),),


            const SizedBox(height: 4),
            TextField(

              obscureText: !_isVisible,
              decoration: InputDecoration(
                hintText: 'Enter',
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

                labelStyle: text14Regular,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
              ),
            ),

            const SizedBox(height: 12,),

            Text('New Password', style: text12Regular.copyWith(color: AppGrey.light600),),


            const SizedBox(height: 4),
            TextField(

              obscureText: !_isVisible,
              decoration: InputDecoration(
                hintText: 'Enter',
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

                labelStyle: text14Regular,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
              ),
            ),

            const SizedBox(height: 12,),

            Text('Re-enter New Password', style: text12Regular.copyWith(color: AppGrey.light600),),


            const SizedBox(height: 4),
            TextField(

              obscureText: !_isVisible,
              decoration: InputDecoration(
                hintText: 'Enter',
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

                labelStyle: text14Regular,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
              ),
            ),





          ],
        ),
      )),

    );
  }

  
}