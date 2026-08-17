import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/role_detail.dart';
import 'package:flutter/material.dart';


class Role extends StatefulWidget{
  
  const Role ({super.key});
  
  
  @override
  State<Role> createState() => RolePage();
  
}


class RolePage extends State<Role>{
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

                    child: Text('Roles & Permissions', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

                  role2('Admin', 'asset/admin.png', '3 members'),

                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  role2('Moderator', 'asset/moderator.png', '2 members')

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

      onTap: (){},

      child: ListTile(

        leading: Icon(Icons.add, size: 16, color: AppGrey.lightMain,),

        title: Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain),),

      ),

    );
    
  }


  InkWell role2 ( String title, String image , String subtitle){


    return InkWell(
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RoleDetail(name: title)),
        );
        
      },
      child: ListTile(

        leading: Image.asset(
            height: 40,
            width: 40,
            image),

        title: Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain),),
        subtitle: Text(subtitle, style: text12Regular.copyWith(color: AppGrey.light500),),

      ),

    );

  }
  
  
  
  
  
  
  
  
  
}