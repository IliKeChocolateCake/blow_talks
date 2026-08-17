import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart' show isDarkMode;
import 'package:flutter/material.dart';


class AllNotifcation extends StatefulWidget{

  const AllNotifcation ({super.key});


  @override
  State<AllNotifcation> createState() => AllNotificationPage();

  
  
}


class AllNotificationPage extends State<AllNotifcation>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,


      body: SingleChildScrollView(

        child: Column(

          children: [

            notificationUser('asset/classroom/enroll/david.png', 'asset/icon/community/hub.png', 'Wong Isabel', 'commented on your post', false, '','22m', false),

            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/david.png', 'asset/icon/community/hub.png', 'Wong Isabel', 'liked your post', false, '','22m', false),

            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/noah.png', 'asset/icon/community/hub.png', 'Noah Davis', 'replied to your comment', false, '','Yesterday',false),

            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/lucas.png', 'asset/icon/community/hub.png', 'Lucas Martinez', 'removed your post based on a report from another member.', true, ' Inappropriate content','Nov 19, 2025',true),

            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/lucas.png', 'asset/icon/community/hub.png', 'Lucas Martinez', 'publish a new post.', false, '','Nov 19, 2025',true),


            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/noah.png', 'asset/icon/community/hub.png', 'Noah Davis', 'commented on your post.', false, '','Nov 19, 2025',false),

            Divider(
              color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            notificationUser('asset/classroom/enroll/seline.png', 'asset/icon/community/hub.png', 'Seline Yong', 'liked your post.', false, '','Nov 19, 2025',false),



















          ],
        ),

      ),

    );
  }
  
  InkWell notificationUser (String avatarImage, String badgeImage, String username, String description, bool reason, String? userReason, String timeAgo, bool admin){

    return InkWell(

      child: ListTile(

        contentPadding: EdgeInsets.zero,
        leading: Stack(
          children: [
           CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(avatarImage),
            ),

            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(badgeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ),


          ],
        ),


        title: Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(username, style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.dark600: AppGrey.light600),),

            if(admin)...[

              SizedBox(width: 4,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDarkMode(context)?AppGrey.darkInputBg:AppGrey.lightInputBg,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400, // your border color here
                    width: 1,
                  ),
                ),
                child: Text('ADMIN', style: text10Medium.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500)),
              ),

            ],

            Spacer(),

            Text(timeAgo, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark400: AppGrey.light400),),

          ],

        ),


        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400),),


            if(reason)...[


              Row(

                children: [

                  Text('Reason: ', style: text12Bold.copyWith(color: isDarkMode(context)?AppGrey.dark400: AppGrey.light400),),
                  Text(userReason!, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400),),
                ],
              ),

            ],

          ],

        ),

        





      ),

    );
  }
  
}