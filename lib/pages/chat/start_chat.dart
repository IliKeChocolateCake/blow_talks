import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



class StartChat extends StatefulWidget{
  
  const StartChat ({super.key});
  
  @override
  State<StartChat> createState() => StartChatPage();
  
}


class StartChatPage extends State<StartChat>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: isDarkMode(context)?AppGradients.darkBackground:AppGradients.lightBackground,
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        child: Icon(Icons.close, color: Colors.black, size: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Start a Chat', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),

                      ],
                    ),
                  ),
                  SizedBox(width: 44),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(

                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 16),
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28), // match SearchBar's default rounded shape
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 16,
                              spreadRadius: 2,
                              offset: Offset.zero, // (0,0) means it spreads evenly on all sides
                            ),
                          ],
                        ),
                        child: SearchBar(
                          leading: Padding(
                            padding: EdgeInsets.only(left: 16, right: 8),
                            child: Icon(Icons.search, size: 16, color: isDarkMode(context)?AppGrey.dark600: AppGrey.light600,),
                          ),
                          hintText: 'Search',
                          hintStyle: WidgetStatePropertyAll(text14Medium.copyWith(color: isDarkMode(context)?AppGrey.dark300:AppGrey.light300)),
                          backgroundColor: WidgetStatePropertyAll(isDarkMode(context)?AppGrey.dark50:AppGrey.light50),
                          elevation: const WidgetStatePropertyAll(0), // turn off default elevation so it doesn't double up
                        ),
                      ),
                    ),


                    SizedBox(height: 16,),
                    members('asset/classroom/enroll/alice.png', 'Alice Yap', 'BEGINNER', 'Seattle, WA', brandColor.withValues(alpha: 0.1), brandColor, brandColor, brandColor, true,'@aliceyap123'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members('asset/classroom/enroll/brian.png', 'Brian Lee', 'EXPLORER', 'Seattle, WA', AppOthers.lightNeonGreenTransparent, Colors.green, AppOthers.lightNeonGreenMain, AppOthers.lightNeonGreenMain, false,'@brianlee223'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members(null, 'Chloe Kim', 'ACHIEVER', 'San Francisco, CA', AppOthers.lightOrangeTransparent, AppOthers.lightOrangeMain, AppOthers.lightOrangeMain, AppOthers.lightOrangeMain, true, '@kim_349'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),

                    members('asset/classroom/enroll/david.png', 'David Chen', 'CHALLENGER', 'Boston, MA', AppOthers.lightPinkTransparent, AppOthers.lightPinkMain, AppOthers.lightPinkMain, AppOthers.lightPinkMain, false, '@davidlee09'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members('asset/classroom/enroll/emily.png', 'Emily Park', 'LEGEND', 'Chicago, IL', AppOthers.lightPurpleTransparent, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, true, '@emilywatson.1030'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members('asset/classroom/enroll/frank.png', 'Frank Liu', 'BEGINNER', 'Miami, FL', brandColor.withValues(alpha: 0.1), brandColor, brandColor, brandColor, false,'@frankliue'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members(null, 'Grace Wu', 'EXPERT', 'Denver, CO', AppOthers.lightBlueTransparent, AppOthers.lightBlueMain, AppOthers.lightBlueMain, AppOthers.lightBlueMain, true,
                        '@gracewuuu'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),

                    members('asset/classroom/enroll/ivy.png', 'Ivy Johnson', 'GRANDMASTER', 'Los Angeles, CA', AppOthers.lightYellowTransparent, AppOthers.lightYellowMain,  AppOthers.lightYellowMain,  AppOthers.lightYellowMain, false,'@ivyjohnson09'),

                    IntrinsicWidth(
                      child: Divider(
                        color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),
                    members('asset/classroom/enroll/isabelle.png', 'Isabelle Wong', 'LEGEND', 'Miami, FL', AppOthers.lightPurpleTransparent, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, AppOthers.lightPurpleMain, false,'@belle34'),

                  ],
                ),

              ),

            ),






          ],
        ),
      ),),
    );
  }

  InkWell members( String? avatarImage, String username, String memberStatus, String location, Color backgroundColor, Color iconColor, Color textColor, Color borderColor, bool online, String alias){

    return InkWell(

      onTap: (){

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => MemberFeed(name: username, image: avatarImage,alias: alias,)),
        // );
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
                  Text(username, style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
                  SizedBox(height: 4),
                  Row(

                    children: [

                      Icon(Icons.location_on_outlined, size: 14, color: AppGrey.light400,),

                      Text(
                        location,
                        style: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.dark500: AppGrey.light500),
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
  
  
}