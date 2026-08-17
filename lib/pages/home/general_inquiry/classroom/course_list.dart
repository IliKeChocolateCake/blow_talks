import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/completed.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/free.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/not_start.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/paid.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/progress.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/selected_member.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/unlock.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget{

  const CourseList ({super.key});

  @override
  State<CourseList> createState() => CourseListPage();
}


class CourseListPage extends State<CourseList>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            course('asset/classroom/free.png', 'Introduction to Artificial Intelligence', 'Free', '4.8 (88)', ' 123 Enrolled', onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsFree()),
              );

            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/complete_history.png', 'Complete History of AI', '\$33', '4.4 (56)', ' 98 Enrolled', onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsPaid()),
              );
            }),

            SizedBox(height: 16,),
            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/machine_learning.png', 'Machine Learning 101', 'Selected Member Only', '4.9 (1.2k)', ' 3.4k Enrolled', onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsSelectedMember()),
              );
            }),



            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            course('asset/classroom/foundation_everyone.png', 'AI Foundation for Everyone', 'Unlock at Level 5', '4.2 (132)', ' 229 Enrolled', onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsUnlock()),
              );
            }),


            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            courseNotStarted('asset/classroom/product_manager.png', 'AI for Project Manager', 'Not Started',
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsNotStarted()),
              );

            }),


            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            courseProgress('asset/classroom/ai_guide.png', 'Complete ChatGPT, Claude AI Guide', 55,
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsProgress()),
              );

            }),


            IntrinsicWidth(
              child: Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),
            ),


            courseCompleted('asset/classroom/deep_learning.png', 'Deep Learning Fundamentals', 'Completed on 15 Jan, 2025', onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CourseDetailsCompleted()),
              );


            }),


          ],

        ),
      ),
    );
  }

  InkWell course (String image, String title, String status, String rating, String enrolled, {VoidCallback? onTap}){
    
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

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
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


  InkWell courseNotStarted (String image, String title, String status, {VoidCallback? onTap}){

    return InkWell(

      child: ListTile(

        onTap: onTap,
        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('$status\n\n', style: text12Medium.copyWith(color: AppGrey.light600),),


          ],

        ),

      ),


    );


  }

  InkWell courseProgress (String image, String title, int progressPercentage, {VoidCallback? onTap}){

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

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressPercentage / 100,
                    backgroundColor: AppGrey.lightMain.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(brandColor), // your app's color
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 6,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '$progressPercentage%',
                  style: text12Regular.copyWith(color: AppGrey.lightMain),
                ),
              ],
            ),

            Text('\n'),
          ],
        ),

      ),


    );


  }


  InkWell courseCompleted (String image, String title, String status, {VoidCallback? onTap}){

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

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

           Wrap(

             crossAxisAlignment: WrapCrossAlignment.start,

             children: [

               Icon(Icons.check, color: brandColor,size: 14,),
               SizedBox(width: 8,),
               Text('$status\n\n', style: text12Medium.copyWith(color: brandColor),),
             ],

           ),


          ],

        ),

      ),


    );


  }


}