import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class Enroll extends StatefulWidget{

  const Enroll ({super.key});


  @override
  State<Enroll> createState() => EnrollPage();


}


class EnrollPage extends State<Enroll>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor: AppGrey.light50,

      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [

                  InkWell(
                    onTap: () { Navigator.pop(context); },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                  ),


                  Text('Enrolled Members', textAlign: TextAlign.center, style: text16Bold.copyWith(color: AppGrey.lightMain),),

                  InkWell(
                    onTap: null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.transparent, size: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              members('asset/classroom/enroll/alice.png', 'Alice Yap', '@aliceyap123'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/brian.png', 'Brian Lee', '@brianlee223'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('', 'Chloe Kim', 'kim_349'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/david.png', 'David Chen', '@davidlee09'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/emily.png', 'Emily Watson', '@emilywatson.1030'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/frank.png', 'Frank Liu', '@frankliue'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('', 'Grace Wu', '@gracewuuu'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/henry.png', 'Henry Smith', '@henrysmith.12'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('asset/classroom/enroll/ivy.png', 'Ivy Johnson', '@ivyjohnson09'),

              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),

              members('', 'Jia Jia', '@jjjiajia'),

            ],
          ),
        ),
      ),


    );


  }


  ListTile members ( String? image, String username, String alias){

    return ListTile(

      contentPadding: EdgeInsets.zero,

      minLeadingWidth: 12,

      leading: (image != null && image.isNotEmpty) ? CircleAvatar(

        radius: 40,
        backgroundColor: Colors.transparent,
        child: Image.asset(image),
      ) : CircleAvatar(
      radius: 40,
      backgroundColor: brandColor.shade100,
      child: Icon(Icons.person, color: brandColor, size: 28),
    ),

      title: Text(username, style: text14Medium.copyWith(color:  AppGrey.lightMain),) ,

      subtitle: Text(alias, style: text12Regular.copyWith(color: AppGrey.light500),),

    );
  }

}