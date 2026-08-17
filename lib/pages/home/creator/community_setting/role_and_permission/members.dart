import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/add_members.dart';
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

        padding: EdgeInsets.all(20),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

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

                    child: Text('Members in this role', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

            Text('3 members in total', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

              ),

              child: Column(

                children: [

                  role('Add New'),
                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  role2('Daisy Parker', 'asset/classroom/enroll/ivy.png', '@daisyparker'),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),


                  role2('Fiona Lee', '', '@fionalee'),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  role2('Hannah Green', 'asset/classroom/enroll/hannah.png', '@hannahgreen')

                ],

              ),


            ),
          ],

        ),

      ),

    );
  }

  InkWell role ( String title ){


    return InkWell(

      onTap: (){



        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: Colors.black.withValues(alpha: 0.5),
          backgroundColor: Colors.transparent,
          builder: (context) => FractionallySizedBox(
            heightFactor: 0.9,
            child: AddMembers(),  // 👈 Pass label
          ),
        );


      },

      child: ListTile(

        leading: Icon(Icons.add, size: 16, color: AppGrey.lightMain,),

        title: Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain),),

      ),

    );

  }


  InkWell role2 ( String title, String image , String subtitle){


    return InkWell(
      onTap: (){

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => RoleDetail(name: title)),
        // );

      },
      child: ListTile(

        leading: (image.isEmpty)?  CircleAvatar(
          radius: 20,
          backgroundColor: brandColor.shade100,
          child: Icon(Icons.person, color: brandColor, size: 28),
        ): CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),

        title: Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain),),
        subtitle: Text(subtitle, style: text12Regular.copyWith(color: AppGrey.light500),),

        trailing: Icon(Icons.close, size: 16, color: AppGrey.light300,),
      ),

    );

  }

}