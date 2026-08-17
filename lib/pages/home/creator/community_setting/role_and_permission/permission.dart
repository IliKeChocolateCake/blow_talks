import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Permission extends StatefulWidget{

  const Permission ({super.key});


  @override
  State<Permission> createState() => PermissionPage();

}

class PermissionPage extends State<Permission>{

  bool admin = false;
  bool createChannel = true;
  bool editChannel = true;
  bool createCategory = true;
  bool editCategory = false;

  bool approveDecline= false;
  bool removeMembers = false;
  bool banMembers = false;


  bool createCourse = false;
  bool editCourse = false;
  bool createDocuments = false;
  bool editDocuments = false;
  bool createEvents = true;
  bool editEvents = true;


  bool removePost = true;
  bool removeComment = false;
  bool removeMessages= true;

  bool publishDraft = false;
  bool archiveContent=false;
  bool pinPost = false;

  @override
  Widget build(BuildContext context) {

   return Scaffold(

     body: SingleChildScrollView(

       child: Container(

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
               padding: const EdgeInsets.symmetric( vertical: 20, ),
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

                     child: Text('Permission', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

             Text('Permissions granted here apply across the channels this role has access to.',
               style: text12Regular.copyWith(color: AppGrey.light400),
             ),

             SizedBox(height: 16,),

             Text('Community Management', style: text12Medium.copyWith(color: AppGrey.light400),),

             SizedBox(height: 12,),


             Container(


               width: double.infinity,

               decoration: BoxDecoration(

                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(10)),



               ),

               child: _toggleTile2(title: 'Administrator', subtitle: 'Members with this permission will have all the same permission as a creator.',value:admin,
                 onChanged: (v) => setState(() => admin = v),),
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
                     _toggleTile2(title: 'Create Channel', subtitle: 'Allow this role to create new channels within the community.',value:createChannel,
                       onChanged: (v) => setState(() => createChannel = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Edit Channel', subtitle: 'Allow this role to edit the name, description, and settings of existing channels.',value:editChannel,
                       onChanged: (v) => setState(() => editChannel = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Create Category', subtitle: 'Allow this role to create new categories to organise channels.',value:createCategory,
                       onChanged: (v) => setState(() => createCategory = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Edit Category', subtitle: 'Allow this role to edit the name, description, and settings of existing categories.',value:editCategory,
                       onChanged: (v) => setState(() => editCategory = v),),

                   ],

                 )
             ),


             SizedBox(height: 16,),

             Text('Membership & User Management', style: text12Medium.copyWith(color: AppGrey.light400),),

             SizedBox(height: 12,),


             Container(


                 width: double.infinity,

                 decoration: BoxDecoration(

                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(10)),



                 ),

                 child: Column(

                   children: [
                     _toggleTile2(title: 'Approve/Decline New Members', subtitle: 'Allow this role to approve or decline new membership requests.',value:approveDecline,
                       onChanged: (v) => setState(() => approveDecline= v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Remove Members', subtitle: 'Allow this role to remove members from the community.',value:removeMembers,
                       onChanged: (v) => setState(() => removeMembers = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Ban Members', subtitle: 'Allow this role to permanently ban members from the community.',value:banMembers,
                       onChanged: (v) => setState(() => banMembers = v),),



                   ],

                 )
             ),

             SizedBox(height: 16,),

             Text('Core Content Creation & Management', style: text12Medium.copyWith(color: AppGrey.light400),),

             SizedBox(height: 12,),

             Container(


                 width: double.infinity,

                 decoration: BoxDecoration(

                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(10)),



                 ),

                 child: Column(

                   children: [
                     _toggleTile2(title: 'Create Courses', subtitle: 'Enable this role to create course.',value:createCourse,
                       onChanged: (v) => setState(() => createCourse = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Edit Others’ Courses', subtitle: 'Allow editing of courses created by other users.',value:editCourse,
                       onChanged: (v) => setState(() => editCourse = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Create Documents', subtitle: 'Enable this role to create and edit documents they’ve created.',value: createDocuments,
                       onChanged: (v) => setState(() => createDocuments = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,),



                       _toggleTile2(title: 'Edit Others’ Documents', subtitle: 'Allow this role to modify the documents created by others.',value:editDocuments,
                         onChanged: (v) => setState(() => editDocuments= v),),


                       Divider(
                         color: AppGrey.light200,
                         thickness: 1,
                       ),

                       _toggleTile2(title: 'Create Events', subtitle: 'Enable this role to create and schedule events within the community. ',value:editEvents,
                         onChanged: (v) => setState(() => createCategory = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Edit Others’ Events', subtitle: 'Allow this role to modify events other people have created.',value:editEvents,
                       onChanged: (v) => setState(() => editEvents = v),),

                   ],

                 )
             ),

             SizedBox(height: 16,),

             Text('Content Moderation & Review', style: text12Medium.copyWith(color: AppGrey.light400),),

             SizedBox(height: 12,),

             Container(


                 width: double.infinity,

                 decoration: BoxDecoration(

                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(10)),



                 ),

                 child: Column(

                   children: [
                     _toggleTile2(title: 'Remove Posts', subtitle: 'Allow this role to remove posts that violate community guidelines.',value:removePost,
                       onChanged: (v) => setState(() => removePost= v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Remove Comments', subtitle: 'Allow this role to remove comments that violate community guidelines.',value:removeComment,
                       onChanged: (v) => setState(() => removeComment = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Remove Messages', subtitle: 'Enable this role to remove messages that violate community guidelines.',value:removeMessages,
                       onChanged: (v) => setState(() => removeMessages = v),),



                   ],

                 )
             ),


             SizedBox(height: 16,),

             Text('Visibility Control', style: text12Medium.copyWith(color: AppGrey.light400),),

             SizedBox(height: 12,),


             Container(


                 width: double.infinity,

                 decoration: BoxDecoration(

                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(10)),



                 ),

                 child: Column(

                   children: [
                     _toggleTile2(title: 'Publish Content in Draft', subtitle: 'Allow this role to publish courses or documents in draft mode.',value:approveDecline,
                       onChanged: (v) => setState(() => approveDecline= v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Archive Content', subtitle: 'Allow this role to archive published courses or documents.',value:removeMembers,
                       onChanged: (v) => setState(() => removeMembers = v),),

                     Divider(
                       color: AppGrey.light200,
                       thickness: 1,
                     ),

                     _toggleTile2(title: 'Pin Post', subtitle: 'Enable this role to create and schedule events within the community. ',value:banMembers,
                       onChanged: (v) => setState(() => banMembers = v),),



                   ],

                 )
             ),

           ],

         ),


       ),

     ),
   );

  }

  Widget _toggleTile2({
    required String title,

    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain), maxLines: 1, overflow:TextOverflow.ellipsis,),

                Text(subtitle, style: text12Regular.copyWith(color: AppGrey.light500),),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,

            // ── Thumb ──

            inactiveThumbColor: Colors.white,

            // ── Track ──
            activeTrackColor: brandColor,
            inactiveTrackColor: AppFixed.lightGrey,

            // ── Track border ──
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return brandColor; // no border when active
              }
              return AppFixed.lightGrey; // border color when inactive
            }),




          ),
        ],
      ),
    );



  }

}