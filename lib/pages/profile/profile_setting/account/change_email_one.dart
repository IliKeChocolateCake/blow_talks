import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/change_email_two.dart';
import 'package:flutter/material.dart';



class ChangeEmailOne extends StatefulWidget{
  
  const ChangeEmailOne ({super.key});
  
  @override
  State<ChangeEmailOne> createState() => ChangeEmailOnePage();
  
}

class ChangeEmailOnePage extends State<ChangeEmailOne>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: SafeArea(child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () { Navigator.pop(context); },
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Change Email', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                        Text('Step 1 of 4', style: text14Regular.copyWith(color: AppGrey.light500),),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {



                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.transparent, size: 24),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 32,),

            Image.asset('asset/profile/verify_email.png', height: 353, width: 353,),

            SizedBox(height: 32,),


          Text('Verify Email', style: text24Bold.copyWith(color: AppGrey.lightMain),),

            SizedBox(height: 8,),
            Text('To proceed with changing your email, we need to verify it\'s you. We’ll send a verification email to ', style: text14Medium.copyWith(color: AppGrey.light500),textAlign:TextAlign.center,),
            Text('s*****3@gmail.com', style: text14Medium.copyWith(color: AppGrey.lightMain),),

            SizedBox(height: 24,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChangeEmailTwo()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: brandColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                elevation: 0,
              ),
              child: Text('Verify Now', style: text14Regular),
            ),

            const Spacer(),

            // footer — no divider, seamless with the gradient background
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02, // 2% of screen height
              ),
              child: Column(
                children: [
                  Text('blowtalks', style: text20Bold.copyWith(color: AppGrey.light300)),
                  Text('Meet. Connect. Thrive.', style: text12Regular.copyWith(color: AppGrey.light300)),
                ],
              ),
            ),




          ],
        ),


      ),)

    );
  }
  
  
}