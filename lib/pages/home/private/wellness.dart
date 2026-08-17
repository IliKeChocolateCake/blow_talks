import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';


class Wellness extends StatefulWidget{

  const Wellness({super.key});

  @override
  State<Wellness> createState() => WellnessPage();
}


class WellnessPage extends State<Wellness>{
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: isDarkMode(context)?AppGradients.darkBackground:AppGradients.lightBackground,
        ),
        child: SingleChildScrollView(

          child: Padding(padding: EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Image.asset('asset/wellness/private.png'),

                SizedBox(height: 16,),
                Image.asset('asset/wellness/join.png'),

                SizedBox(height: 16,),

                Text('30-Day AI Wellness Challenge', style: text24Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),
                Text('Each day, we’ll share tips, exercises, and insights designed to help you harness the power of AI for a healthier, happier life. Join us on this transformative journey and discover how technology can support your wellness goals!'

                    ,textAlign: TextAlign.center, style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark600:AppGrey.light600),
                ),

                SizedBox(height: 12,),
                
                Text('\$19.99', style: text32Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),

                SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){

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
                      'Join Now',
                      style: text14Regular,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }


}


