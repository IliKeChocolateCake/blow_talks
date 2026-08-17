import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/onboarding/login.dart';
import 'package:flutter/material.dart';


class CommunityList extends StatefulWidget{

  const CommunityList({super.key});

  @override
  State<CommunityList> createState() => CommunityListPage();
}


class CommunityListPage extends State<CommunityList>{
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
                  
                  Text('Communities', style: text16Bold,),

                  SizedBox(height: 12,),

                  Container(


                    width: double.infinity,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),


                    ),

                    child: Column(


                      children: [

                        _titleNotification(context, 'AI Hub by Jane', 'asset/icon/community/hub.png', badgeCount: 1),

                        _titleLog('Creative Hub', 'asset/icon/community/creative.png'),

                        _titleLog('Metaverse Explorers', 'asset/icon/community/metaverse.png'),



                      ],
                    ),

                  ),


                  SizedBox(height: 12,),

                  Container(


                    width: double.infinity,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),


                    ),

                    child: Column(


                      children: [

                        _titleLog2('Create Community', Icons.add, AppGrey.lightMain),

                        _titleLog3('Log Out', Icons.logout, AppAlert.lightError500, onTap: (){

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const Login()),
                          );
                        }),





                      ],
                    ),

                  ),
                ],
              ),
            ),

          ),
        ),
    );
  }


  ListTile _titleLog(String title, String image, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      leading: Image.asset(image),
      onTap: onTap,
    );
  }


  ListTile _titleLog2(String title, IconData icon,Color bgm, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      leading: Icon(icon, color:  bgm ),
      onTap: onTap,
    );
  }
  ListTile _titleLog3(String title, IconData icon,Color bgm, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppAlert.lightError500),
      ),
      leading: Icon(icon, color:  bgm ),
      onTap: onTap,
    );
  }

  ListTile _titleNotification(BuildContext context, String title, String image,
      {int badgeCount = 0, VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      leading: Image.asset(image),
      trailing: badgeCount > 0
          ? Icon(Icons.check, color: brandColor,)
          : null, // no trailing if count is 0
      onTap: onTap,
    );
  }

}


