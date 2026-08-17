import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/community_profile.dart';
import 'package:blow_talks/pages/home/creator/community_setting/discoverability.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_category/manage_categories.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/manage_channel.dart';
import 'package:blow_talks/pages/home/creator/community_setting/membership.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/role.dart';
import 'package:blow_talks/pages/home/creator/community_setting/transaction/transactions.dart';
import 'package:blow_talks/pages/home/creator/community_setting/wallet/wallet.dart';
import 'package:flutter/material.dart';



class Setting extends StatefulWidget{
  
  const Setting ({super.key});
  
  @override
  State<Setting> createState() => SettingPage();
}


class SettingPage extends State<Setting>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppGrey.light100,

      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () { Navigator.pop(context); },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
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

                  Expanded(
                    child: Center( // 👈 Add this
                      child: Text('Community Settings', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),

                  InkWell(
                    onTap: () {



                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.transparent, size: 24),
                      ),
                    ),
                  ),

                ],
              ),
            ),


            Text('General', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Community Profile', 'asset/creator_community_setting/community.png', onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CommunityProfile()),
                    );
                  }),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Membership', 'asset/creator_community_setting/membership.png', onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Membership()),
                    );

                  }),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Discoverability', 'asset/creator_community_setting/discover.png', onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Discoverability()),
                    );

                  }),


                ],
              ),
            ),


            SizedBox(height: 16,),

            Text('Channels & Categories', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Manage Channels', 'asset/creator_community_setting/manage.png', onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ManageChannel()),
                    );
                  }),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Manage Categories', 'asset/creator_community_setting/category.png', onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ManageCategories()),
                    );
                  }),




                ],
              ),
            ),


            SizedBox(height: 16,),

            Text('Members', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Roles & Permissions', 'asset/creator_community_setting/role.png', onTap: (){


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Role()),
                    );

                  }),




                ],
              ),
            ),


            SizedBox(height: 16,),

            Text('Payments', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Transactions', 'asset/creator_community_setting/transaction.png',
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Transactions()),
                    );

                  }),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('My Wallets', 'asset/creator_community_setting/wallet.png', onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Wallet()),
                    );


                  }),




                ],
              ),
            ),


            SizedBox(height: 16,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog2('Delete Community', 'asset/creator_community_setting/delete.png'),




                ],
              ),
            ),



          ],
        ),
        ),
      ),
    );
  }

  ListTile _titleLog(String title, String image, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Regular.copyWith(color: AppGrey.lightMain),
      ),
      leading: SizedBox(
        width: 16,
        height: 16,
        child: Image.asset(image),
      ),
      onTap: onTap,
      
      trailing: Icon(Icons.chevron_right, size: 16, color: AppGrey.light300,),
    );
  }


  ListTile _titleLog2(String title, String image, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Regular.copyWith(color: AppGrey.lightMain),
      ),
      leading: SizedBox(
        width: 16,
        height: 16,
        child: Image.asset(image),
      ),
      onTap: onTap,


    );
  }
  
}