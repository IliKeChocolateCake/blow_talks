import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/creator_classroom/creator_classroom.dart';
import 'package:blow_talks/pages/home/creator/creator_events/creator_events.dart';
import 'package:blow_talks/pages/home/general_inquiry/chatroom/chatroom.dart';
import 'package:blow_talks/pages/home/general_inquiry/discussion/discussion.dart';
import 'package:blow_talks/pages/home/general_inquiry/documentation/documentation.dart';
import 'package:blow_talks/pages/home/general_inquiry/member/members.dart';
import 'package:flutter/material.dart';





class CreatorContentTypeBottomsheet extends StatefulWidget{

  const CreatorContentTypeBottomsheet ({super.key});


  @override
  State<CreatorContentTypeBottomsheet> createState() => ContentTypeBottomsheetPage();

}

class ContentTypeBottomsheetPage extends State<CreatorContentTypeBottomsheet>{
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
          gradient: AppGradients.lightBackground,
        ),
        child: SingleChildScrollView(

          child: Padding(padding: EdgeInsets.all(16),

            child: Column(

              children: [

                Text('Content Types', style: text16Bold,),

                SizedBox(height: 12,),

                Container(


                  width: double.infinity,

                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),


                  ),

                  child: Column(


                    children: [


                      _titleLog('Discussion', 'asset/discuss.png', AppOthers.darkPinkMain, onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const Discussion()),
                        );
                      } ),

                      _titleLog('Classroom', 'asset/classroom.png', AppOthers.lightOrangeMain, onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CreatorClassroom()),
                        );
                      } ),

                      _titleLog('Documentation', 'asset/documentation.png', AppOthers.lightBlueMain, onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Documentation()),
                        );

                      } ),

                      _titleLog('Events', 'asset/events.png', AppOthers.lightPurpleMain, onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CreatorEvents()),
                        );

                      } ),

                      _titleLog('Member', 'asset/members.png', AppOthers.lightNeonGreenMain, onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Members()),
                        );

                      } ),

                      _titleLog('Chatroom', 'asset/chatroom.png', brandColor, onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Chatroom()),
                        );

                      } ),


                    ],
                  ),

                ),


                SizedBox(height: 12,),


              ],
            ),
          ),

        ),
      ),
    );
  }


  ListTile _titleLog(String title, String image, Color bgm, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      leading: Image.asset(
          width: 40,
          height: 40,
          image),
      onTap: onTap,
    );
  }



}




