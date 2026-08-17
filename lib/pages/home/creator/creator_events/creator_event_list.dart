import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/creator_events/creator_one_off.dart';
import 'package:blow_talks/pages/home/creator/creator_events/creator_series.dart';
import 'package:blow_talks/pages/home/general_inquiry/events/event_type/series.dart';
import 'package:flutter/material.dart';

class CreatorEventsList extends StatefulWidget{

  const CreatorEventsList ({super.key});

  @override
  State<CreatorEventsList> createState() => EventsListPage();
}


class EventsListPage extends State<CreatorEventsList>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Padding(

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child:  Wrap(


              children: [

                Text('22 Aug', style: text14Bold.copyWith(color: AppGrey.lightMain),),

                SizedBox(width: 8,),

                Text('Friday', style: text14Regular.copyWith(color: AppGrey.light400),),
              ],

            ),

            ),


            Events('asset/events/coffee.png', 'Coffee & Books', true, '04:00 PM', 'Virtual Session', true, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatorSeries()),
              );

            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            Events('asset/events/dance.png', 'Dance the Night Away Party', false, '08:00 PM', '3966 Watson Street, New Jersey',false, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatorOneOff()),
              );
            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            Padding(

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child:  Wrap(


                children: [

                  Text('26 Aug', style: text14Bold.copyWith(color: AppGrey.lightMain),),

                  SizedBox(width: 8,),

                  Text('Tuesday', style: text14Regular.copyWith(color: AppGrey.light400),),
                ],

              ),

            ),

            Events('asset/events/assistant.jpg', 'Mastering Your AI Assistant', false, '08:00 PM', '13, Jln duku, Taman pertama, 55120 Kuala Lumpur',false, onTap: () {

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => const EventsDetailsSelectedMember()),
              // );
            }),



            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),

            Padding(

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child:  Wrap(


                children: [

                  Text('22 Sep', style: text14Bold.copyWith(color: AppGrey.lightMain),),

                  SizedBox(width: 8,),

                  Text('Monday', style: text14Regular.copyWith(color: AppGrey.light400),),
                ],

              ),

            ),

            Events('asset/events/coffee.png', 'Coffee & Books', true, '04:00 PM', 'Virtual Session',true, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Series()),
              );
            }),


          ],

        ),
      ),
    );
  }

  InkWell Events (String image, String title, bool seriesStatus, String rating, String enrolled, bool virtual, {VoidCallback? onTap}){

    return InkWell(

      onTap: onTap,

      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),

        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),

            if(seriesStatus)...[


              buildBadge(seriesBadge),


            ]

          ],
        ),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [



            Row(

              children: [
                Icon(Icons.access_time, size: 14, color: AppGrey.light400,),
                SizedBox(width: 4,),
                Text(rating, style: text12Medium.copyWith(color: AppGrey.light600)),
                SizedBox(width: 12,),

                (virtual) ?
                Icon(Icons.videocam_outlined, size: 14, color: AppGrey.light400,) : Icon(Icons.location_on_outlined, size: 14, color: AppGrey.light400,),
                SizedBox(width: 4,),
                Expanded(
                  child: Text(
                    enrolled,
                    style: text12Medium.copyWith(color: AppGrey.light600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],

        ),

      ),


    );


  }


  Widget buildBadge(BadgeModel badge) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: badge.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badge.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badge.icon, size: 8, color: badge.iconColor),
          const SizedBox(width: 4),
          Text(
            badge.label,
            style: text12Medium.copyWith(color: badge.textColor),
          ),
        ],
      ),
    );
  }

}


// ── Badge data ──
class BadgeModel {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  const BadgeModel({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
  });
}


final seriesBadge = BadgeModel(
  label: 'SERIES',
  icon: Icons.brightness_1,
  backgroundColor: AppGrey.light200,
  iconColor: AppOthers.lightPurpleMain,
  textColor: AppGrey.lightMain,
  borderColor: AppGrey.light300,
);