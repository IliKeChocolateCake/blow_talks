import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class CompletedModuleBottomsheet extends StatefulWidget{

  const CompletedModuleBottomsheet ({super.key});


  @override
  State<CompletedModuleBottomsheet> createState() => CompletedModuleBottomsheetPage();

}


class CompletedModuleBottomsheetPage extends State<CompletedModuleBottomsheet>{
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
          color: Color(0xFFCCCCCC),
        ),
        child: SingleChildScrollView(

          child: Padding(padding: EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Image.asset(
                  height: 240,
                    width: 240,
                    'asset/classroom/complete.png'),




                Text('Module Completed', style: text24Bold.copyWith(color: AppGrey.lightMain),),
                Text('You’ve completed the module ‘Exploring the History of Philosophical Thought’'

                  ,textAlign: TextAlign.center, style: text14Regular.copyWith(color: AppGrey.light600),
                ),


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
                      'Go to next module',
                      style: text14Regular,
                    ),
                  ),
                ),

                SizedBox(height: 12,),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Take a break',
                      style: text14Regular.copyWith(color: AppGrey.lightMain),
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