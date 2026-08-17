import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/account.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class ChangeEmailFour extends StatefulWidget{

  const ChangeEmailFour({super.key});

  @override
  State<ChangeEmailFour> createState() => ChangeEmailTwoPage();

}

class ChangeEmailTwoPage extends State<ChangeEmailFour>{

  final int pinCode =888888;

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
                          Text('Step 4 of 4', style: text14Regular.copyWith(color: AppGrey.light500),),
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

                child: Text('Enter Code', style: text24Bold.copyWith(color: AppGrey.lightMain),),

              ),

              SizedBox(height: 8,),

              Center(

                child:   Wrap(

                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Text('A verifcation code has been sent to ',style: text14Regular.copyWith(color: AppGrey.light500),),
                    Text('s*****3@gmail.com', style: text14Bold.copyWith(color: AppGrey.lightMain),),
                    Text('. Please check your inbox.', style: text14Regular.copyWith(color: AppGrey.light500),)
                  ],
                ),

              ),



              SizedBox(height: 32,),

              PinInput(
                length: 6,
                builder: (context, cells) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final cellWidth = (screenWidth - 40) / 6 - 8; // auto calculate per screen

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: cells.map((cell) {
                      return Container(
                        width: cellWidth,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: cell.isFocused
                              ? const Color(0xff0AAB83).withValues(alpha: 0.1)
                              : AppGrey.lightInputBg,
                          border: Border.all(
                            color: cell.isFocused
                                ? const Color(0xff0AAB83)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cell.character ?? '',
                            style: text24Bold,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
                onCompleted: (value) {
                  if (int.parse(value) == pinCode) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Account()),
                    );
                  } else {
                    // wrong PIN
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Incorrect PIN, try again.')),
                    );
                  }
                },
              ),


              const SizedBox(height: 32),

              Center(

                child:  Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [

                    Text('Didn\'t receive code?', style: text14Regular.copyWith(color: AppGrey.light500),),
                    TextButton(onPressed: (){}, child: Text('Resend it.', style: text14Regular.copyWith(color: brandColor),))
                  ],
                ),

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