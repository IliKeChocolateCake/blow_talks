import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class AddMembers extends StatefulWidget{

  const AddMembers ({super.key});


  @override
  State<AddMembers> createState() => AddMembersPage();


}


class AddMembersPage extends State<AddMembers>{
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
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
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
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(Icons.chevron_left,
                                    color: Colors.black, size: 24),
                              ),
                            ),
                          ),
                          Expanded(child: Center(

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text('Add Members', style: text16Bold.copyWith(color: AppGrey.lightMain),),
                                  Text('Selected: 3', style: text14Regular.copyWith(color: AppGrey.light500),),
                                ],

                              ),

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
                                color: brandColor,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.15),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(Icons.check,
                                    color: Colors.white, size: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only( bottom: 16, ),
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
                            child: Icon(Icons.search, size: 16, color: AppGrey.light600,),
                          ),
                          hintText: 'Search',
                          hintStyle: WidgetStatePropertyAll(text14Medium.copyWith(color: AppGrey.light300)),
                          backgroundColor: const WidgetStatePropertyAll(Colors.white),
                          elevation: const WidgetStatePropertyAll(0), // turn off default elevation so it doesn't double up
                        ),
                      ),
                    ),


                    members2('asset/classroom/enroll/alice.png', 'Alice Yap', '@aliceyap123'),

                    IntrinsicWidth(
                      child: Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),
                    ),

                    members2('asset/classroom/enroll/brian.png', 'Brian Lee', '@brianlee223'),

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

                    members2('asset/classroom/enroll/emily.png', 'Emily Watson', '@emilywatson.1030'),

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

        radius: 20,
        backgroundColor: Colors.transparent,
        child: Image.asset(image),
      ) : CircleAvatar(
        radius: 20,
        backgroundColor: brandColor.shade100,
        child: Icon(Icons.person, color: brandColor, size: 28),
      ),

      title: Text(username, style: text14Medium.copyWith(color:  AppGrey.lightMain),) ,

      subtitle: Text(alias, style: text12Regular.copyWith(color: AppGrey.light500),),

    );
  }

  ListTile members2 ( String? image, String username, String alias){

    return ListTile(

      contentPadding: EdgeInsets.zero,

      minLeadingWidth: 12,

      leading: (image != null && image.isNotEmpty) ? CircleAvatar(

        radius: 20,
        backgroundColor: Colors.transparent,
        child: Image.asset(image),
      ) : CircleAvatar(
        radius: 20,
        backgroundColor: brandColor.shade100,
        child: Icon(Icons.person, color: brandColor, size: 28),
      ),

      title: Text(username, style: text14Medium.copyWith(color:  AppGrey.lightMain),) ,

      subtitle: Text(alias, style: text12Regular.copyWith(color: AppGrey.light500),),
      
      
      trailing: Icon(Icons.check, size: 16, color: brandColor,),

    );
  }

}