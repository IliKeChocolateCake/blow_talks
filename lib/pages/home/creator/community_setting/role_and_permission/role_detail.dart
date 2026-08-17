import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/bypass_access.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/members.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/permission.dart';
import 'package:blow_talks/pages/home/creator/community_setting/role_and_permission/role_color.dart';
import 'package:flutter/material.dart';


class RoleDetail extends StatefulWidget{

  final String name;
  const RoleDetail ({super.key, required this.name});

  @override
  State<RoleDetail> createState() => RoleDetailPage();

}


class RoleDetailPage extends State<RoleDetail>{

  TextEditingController get _nameController => TextEditingController(text: widget.name);
  final TextEditingController _bioController = TextEditingController(
    text:
    'Admin who has global access to every channel in the community.',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: AppGradients.lightBackground,
          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 20,),
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

                      child: Text('Role Detail', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

              Text('Role Name', style: text12Regular.copyWith(color: AppGrey.light600)),
              const SizedBox(height: 6),
              TextField(

                readOnly: true,
                controller: _nameController,
                style: text14Regular.copyWith(color: AppGrey.lightMain),
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppGrey.light200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: brandColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),

              const SizedBox(height: 12),


              Text('Description', style: text12Regular.copyWith(color: AppGrey.light600)),
              const SizedBox(height: 6),
              TextField(
                controller: _bioController,
                maxLines:5,
                minLines: 5,
                maxLength: 80,
                style: text14Regular.copyWith(color: AppGrey.lightMain),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppGrey.light200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: brandColor),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),

              const SizedBox(height: 4),
              Text('Max 80 characters', style: text12Regular.copyWith(color: AppGrey.light400)),

              const SizedBox(height: 20),


              Container(

                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),

                child: Column(

                  children: [

                    _titleLog2('Role Colour', onTap: (){

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.25,
                          child: RoleColor(),  // 👈 Pass label
                        ),
                      );

                    }),



                  ],

                ),

              ),


              SizedBox(height: 12,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),

                child: Column(

                  children: [

                    _titleLog3('Bypass Access', onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BypassAccess()),
                      );
                    }),
                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                    _titleLog3('Permission', onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Permission()),
                      );
                    }),



                  ],

                ),

              ),

              SizedBox(height: 12,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),

                child: Column(

                  children: [

                    _titleLog('Members','3', onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Members()),
                      );

                    }),



                  ],

                ),

              ),



              SizedBox(height: 12,),


              InkWell(

                onTap: (){

                  debugPrint('n');
                },

                child: Container(

                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                  ),

                  child: Text(
                    'Delete Role',
                    style: text14Regular.copyWith(color: AppAlert.lightError500),
                  ),


                ),

              ),





            ],
          ),
        ),

      ),

    );
  }

  ListTile _titleLog(String title, String value, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16,),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Regular.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // 👈 This is the key fix
        children: [
          Text(value, style: text14Regular.copyWith(color: AppGrey.light400)),
          Icon(Icons.chevron_right, size: 16, color: AppGrey.light300),
        ],
      ),
    );
  }


  ListTile _titleLog2(String title, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16,),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Regular.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // 👈 This is the key fix
        children: [
          Icon(Icons.brightness_1, size: 20, color: AppOthers.lightBlueMain,),
          Icon(Icons.unfold_more, size: 16, color: AppGrey.light300),
        ],
      ),
    );
  }

  ListTile _titleLog3(String title, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16,),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Regular.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right, size: 16, color: AppGrey.light300),
    );
  }

}