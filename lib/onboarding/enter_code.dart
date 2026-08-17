import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/onboarding/set_new_password.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';





class EnterCode extends StatefulWidget{

  const EnterCode({super.key});



  @override
  State<EnterCode> createState() => EnterCodePage();



}


class EnterCodePage extends State<EnterCode>{

  final int pinCode =888888;

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

              child: Text('Enter Code', textAlign: TextAlign.center, style: text24Bold,),
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
                  // correct PIN
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SetNewPassword()),
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


          ],
        ),

      ),



    );
  }



}