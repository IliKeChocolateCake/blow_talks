import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class ContentType extends StatefulWidget{

  const ContentType ({super.key});

  @override
  State<ContentType> createState() => ContentTypePage();

}

class ContentTypePage extends State<ContentType>{
  @override
  Widget build(BuildContext context) {
    return ClipRRect(

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),

        child: SingleChildScrollView(

          child: Container(
            width: double.infinity,

            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: AppGradients.lightBackground,
            ),

            child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // if (Navigator.canPop(context)) {
                          //   Navigator.pop(context);
                          // }
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 8,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.chevron_left,
                                color: Colors.transparent, size: 24),
                          ),
                        ),
                      ),
                      Expanded(child: Center(

                        child: Text('Select Content Type', style: text16Bold.copyWith(color: AppGrey.lightMain),),

                      ),),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => AddNewPrice()),
                          // );
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),

                          ),
                          child: const Center(
                            child: Icon(Icons.check,
                                color: Colors.transparent, size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                _titleLog('Discussion', 'A place for members to post, comment and interact.', 'asset/discuss.png'),
                SizedBox(height: 12,),
                _titleLog('Classroom', 'A dedicated area for structured courses and lessons.', 'asset/classroom.png'),
                SizedBox(height: 12,),
                _titleLog('Documentation', 'Create a page for guidelines, announcement, or text content.', 'asset/documentation.png'),
                SizedBox(height: 12,),
                _titleLog('Chatroom', 'Create a place for member to connect and chat casually.', 'asset/chatroom.png'),
                SizedBox(height: 12,),
                _titleLog('Events', 'A dedicated area for members to explore upcoming events.', 'asset/events.png'),
                SizedBox(height: 12,),
                _titleLog('Members', 'A place for members to connect and befriend each other.', 'asset/members.png'),
                SizedBox(height: 12,),


              ],

            ),
          ),

        ),

    );
  }

  Widget _titleLog(String title, String subtitle, String image, {VoidCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: AppGrey.light200)

      ),

      child: ListTile(

        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        // minLeadingWidth: 40,
        title: Text(
          title,
          style: text14Medium.copyWith(color: AppGrey.lightMain),
        ),
        subtitle: Text(subtitle, style: text12Regular.copyWith(color: AppGrey.light500),),
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(image),
        ),
        onTap: onTap,

      ),

    );
  }

}