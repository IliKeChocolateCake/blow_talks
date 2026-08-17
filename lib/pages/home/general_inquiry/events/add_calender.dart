import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class AddCalender extends StatefulWidget{

  const AddCalender ({super.key});


  @override
  State<AddCalender> createState() => AddCalenderPage();

}


class AddCalenderPage extends State<AddCalender>{
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

          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Image.asset('asset/events/calendar.png', height: 216, width: 239,),




                Text('Add to Calendar', style: text24Bold.copyWith(color: AppGrey.lightMain),),
                Text('Choose the calendar to which you would like to add this event.'

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
                      'Add to Google Calendar',
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
                      'Add to Apple Calendar',
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