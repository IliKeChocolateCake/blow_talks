import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/content_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/general_inquiry/member/member_feed.dart';
import 'package:flutter/material.dart';




class Members extends StatefulWidget{


  const Members ({super.key});
  
  @override
  State<Members> createState() => MembersPage();
  
}


class MembersPage extends State<Members>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all( 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('General Inquiry', style: text16Bold),
                        InkWell(
                          onTap: () {

                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              barrierColor: Colors.black.withValues(alpha: 0.5),
                              backgroundColor: Colors.transparent,
                              builder: (context) => FractionallySizedBox(
                                heightFactor: 0.5, // 90% height
                                child: const ContentTypeBottomsheet(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Members', style: text12Regular.copyWith(color: Colors.grey)),
                              Icon(Icons.unfold_more, size: 12, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 44),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(

              child: Column(

                children: [
                  members('asset/classroom/enroll/alice.png', 'Alice Yap', 'BEGINNER', 'Seattle, WA', brandColor.withValues(alpha: 0.1), brandColor, brandColor, brandColor, true,'@aliceyap123'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),
                  members('asset/classroom/enroll/brian.png', 'Brian Lee', 'EXPLORER', 'Seattle, WA', AppOthers.lightNeonGreenTransparent, Colors.green, AppOthers.lightNeonGreenMain, AppOthers.lightNeonGreenMain, false,'@brianlee223'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),
                  members(null, 'Chloe Kim', 'ACHIEVER', 'San Francisco, CA', AppOthers.lightOrangeTransparent, AppOthers.lightOrangeMain, AppOthers.lightOrangeMain, AppOthers.lightOrangeMain, true, '@kim_349'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),

                  members('asset/classroom/enroll/david.png', 'David Chen', 'CHALLENGER', 'Boston, MA', AppOthers.lightPinkTransparent, AppOthers.lightPinkMain, AppOthers.lightPinkMain, AppOthers.lightPinkMain, false, '@davidlee09'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),
                  members('asset/classroom/enroll/emily.png', 'Emily Park', 'LEGEND', 'Chicago, IL', AppOthers.lightPurpleTransparent, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, true, '@emilywatson.1030'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),
                  members('asset/classroom/enroll/frank.png', 'Frank Liu', 'BEGINNER', 'Miami, FL', brandColor.withValues(alpha: 0.1), brandColor, brandColor, brandColor, false,'@frankliue'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),
                  members(null, 'Grace Wu', 'EXPERT', 'Denver, CO', AppOthers.lightBlueTransparent, AppOthers.lightBlueMain, AppOthers.lightBlueMain, AppOthers.lightBlueMain, true,
                  '@gracewuuu'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  ),

                  members('asset/classroom/enroll/ivy.png', 'Ivy Johnson', 'GRANDMASTER', 'Los Angeles, CA', AppOthers.lightYellowTransparent, AppOthers.lightYellowMain,  AppOthers.lightYellowMain,  AppOthers.lightYellowMain, false,'@ivyjohnson09'),

                  IntrinsicWidth(
                    child: Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                  )
                  ,
                  members('asset/classroom/enroll/isabelle.png', 'Isabelle Wong', 'LEGEND', 'Miami, FL', AppOthers.lightPurpleTransparent, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, false,'@belle34'),

                ],
              ),

            ),

            ),






          ],
        ),
      ),
    );
  }
  

  InkWell members( String? avatarImage, String username, String memberStatus, String location, Color backgroundColor, Color iconColor, Color textColor, Color borderColor, bool online, String alias){

    return InkWell(

      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MemberFeed(name: username, image: avatarImage,alias: alias,)),
        );
      },

      child: Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),


        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(

              children: [

                avatarImage != null ?
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(avatarImage),
                ) : CircleAvatar(
                  radius: 26,
                  backgroundColor: brandColor.shade100,
                  child: Icon(Icons.person, color: brandColor, size: 28),
                ),

                Positioned(
                  bottom: 1,
                  right: 1,

                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: online ? Colors.green : AppGrey.light300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(username, style: text14Medium.copyWith(color: AppGrey.lightMain),),
                      SizedBox(width: 8),
                      _buildBadge(memberStatus, Icons.diamond, backgroundColor, iconColor,textColor, borderColor),

                    ],
                  ),
                  SizedBox(height: 4),
                  Row(

                    children: [

                      Icon(Icons.location_on_outlined, size: 14, color: AppGrey.light400,),

                      Text(
                        location,
                        style: text12Medium.copyWith(color: AppGrey.light500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],

                  ),

                ],
              ),
            ),
          ],
        ),

      ),

    );
  }


  Widget _buildBadge(String label, IconData icon, Color backgroundColor, Color iconColor, Color textColor, Color borderColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor, // your border color here
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: iconColor),
          SizedBox(width: 4),
          Text(label, style: text10Medium.copyWith(color: textColor)),
        ],
      ),
    );
  }
  
}