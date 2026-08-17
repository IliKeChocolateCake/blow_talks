import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/change_email_four.dart';
import 'package:flutter/material.dart';




class ChangeEmailThree extends StatefulWidget{

  
  const ChangeEmailThree ({super.key});
  
  
  @override
  State<ChangeEmailThree> createState() => ChangeEmailThreePage();

}


class ChangeEmailThreePage extends State<ChangeEmailThree>{


  @override
  Widget build(BuildContext context) {
  
    
    return Scaffold(
      
      body: SafeArea(child: Container(

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
                        Text('Step 3 of 4', style: text14Regular.copyWith(color: AppGrey.light500),),
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

            SizedBox(height: 40,),

            Center(

              child: Text('New Email', style: text24Bold.copyWith(color: AppGrey.lightMain),),

            ),


            Center(

              child: Text('Please enter your new email address.', textAlign: TextAlign.center, style: text14Regular.copyWith(color: AppGrey.light500),),

            ),


            SizedBox(height: 32,),

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
                    MaterialPageRoute(builder: (_) => const ChangeEmailFour()),
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

            const Spacer(),

            // footer — no divider, seamless with the gradient background
           Center(child:  Padding(
             padding: EdgeInsets.symmetric(
               vertical: MediaQuery.of(context).size.height * 0.02, // 2% of screen height
             ),
             child: Column(
               children: [
                 Text('blowtalks', style: text20Bold.copyWith(color: AppGrey.light300)),
                 Text('Meet. Connect. Thrive.', style: text12Regular.copyWith(color: AppGrey.light300)),
               ],
             ),
           ),),
          ],

        ),





      )),
    );
  }




  
}