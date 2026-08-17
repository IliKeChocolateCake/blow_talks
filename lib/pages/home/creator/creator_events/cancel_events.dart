import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class CancelEvents extends StatefulWidget{

  const CancelEvents ({super.key});


  @override
  State<CancelEvents> createState() => AddCalenderPage();

}


class AddCalenderPage extends State<CancelEvents>{
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


                Image.asset('asset/events/cancel_event.png', height: 216, width: 239,),




                Text('Cancel Event?', style: text24Bold.copyWith(color: AppGrey.lightMain),),
                Text('Are you sure you want to cancel this event? We\'ll notify all attendees about the cancellation.'

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
                      backgroundColor: AppAlert.lightError500, // brandColor 500
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Cancel Event',
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
                      'Keep',
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