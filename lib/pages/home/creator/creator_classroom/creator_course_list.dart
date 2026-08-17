import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/creator_classroom/creator_archive.dart';
import 'package:blow_talks/pages/home/creator/creator_classroom/creator_free.dart';
import 'package:blow_talks/pages/home/creator/creator_classroom/creator_publish.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/unlock.dart';
import 'package:flutter/material.dart';

class CreatorCourseList extends StatefulWidget{

  const CreatorCourseList ({super.key});

  @override
  State<CreatorCourseList> createState() => CourseListPage();
}


class CourseListPage extends State<CreatorCourseList>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(



      backgroundColor: Colors.transparent,

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            course('asset/classroom/free.png', 'Introduction to Artificial Intelligence', 'Free', '4.8 (88)', ' 123 Enrolled','PUBLISHED',brandColor, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatorCourseDetailsFree()),
              );

            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/complete_history.png', 'Complete History of AI', '\$33', '4.4 (56)', ' 98 Enrolled','DRAFT',AppOthers.lightBlueMain, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatorPublish()),
              );
            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/machine_learning.png', 'Machine Learning 101', 'Selected Member Only', '4.9 (1.2k)', ' 3.4k Enrolled','ARCHIVED',AppGrey.light500, onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatorArchive()),
              );
            }),



            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/foundation_everyone.png', 'AI Foundation for Everyone', 'Unlock at Level 5', '4.2 (132)', ' 229 Enrolled','PUBLISHED',brandColor, onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsUnlock()),
              );
            }),




          ],

        ),
      ),
    );
  }

  InkWell course (String image, String title, String status, String rating, String enrolled, String label, Color iconColor, {VoidCallback? onTap}){

    return InkWell(

      onTap: onTap,

      child: ListTile(

        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppGrey.light200,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: AppGrey.light300, // your border color here
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.brightness_1, size: 6, color: iconColor),
                  SizedBox(width: 4),
                  Text(label, style: text10Medium.copyWith(color: AppGrey.lightMain)),
                ],
              ),
            ),

            SizedBox(height: 8,),

            Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
          ],

        ),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(status, style: text12Medium.copyWith(color: AppGrey.lightMain),),

            Row(

              children: [
                Icon(Icons.star, size: 14, color: AppOthers.lightYellowMain,),
                Text(rating, style: text12Medium.copyWith(color: AppGrey.light600)),
                SizedBox(width: 12,),
                Icon(Icons.people_alt_outlined, size: 14, color: AppGrey.light400,),
                Text(enrolled, style: text12Medium.copyWith(color: AppGrey.light600))
              ],
            )
          ],

        ),

      ),


    );
    
    
  }





}