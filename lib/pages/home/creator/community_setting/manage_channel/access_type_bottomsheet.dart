import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/member_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum access {public, paid, levelUnlock, selectedMember

}

enum member {all, only}

class AccessTypeBottomsheet extends StatefulWidget{

  const AccessTypeBottomsheet ({super.key});

  @override
  State<AccessTypeBottomsheet> createState() => AccessTypeBottomSheetPage();

}


class AccessTypeBottomSheetPage extends State<AccessTypeBottomsheet>{

  access? ac = .public;
  member? mm =.only;
  bool paidAccess=false;
  bool levelAccess=false;
  bool selectedAccess=false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),

      child: SingleChildScrollView(

        child:Container(
          width: double.infinity,

          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: AppGradients.lightBackground,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

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

                      child: Text('Access Type', style: text16Bold.copyWith(color: AppGrey.lightMain),),

                    ),),

                 (ac == access.paid ||
                        ac == access.levelUnlock ||
                        ac == access.selectedMember) ?
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
                    ) :  InkWell(
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


              SizedBox(height: 12,),
              Text('Access Type', style: text12Medium.copyWith(color: AppGrey.light400),),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),


                child:  RadioGroup<access>(
                  groupValue: ac,
                  onChanged: (access? value) {




                    setState(() {
                      ac = value;
                    });
                  },


                  child: Column(
                    children: <Widget>[
                      RadioListTile<access>(
                        title: Text('Public', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                        subtitle: Text('Anyone in this community can access to this channel.', style: text12Regular.copyWith(color: AppGrey.light500),),
                        value: access.public,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: brandColor,

                      ),
                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),
                      RadioListTile<access>(
                        title: Text('Paid', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                        subtitle: Text('Members need to pay an one-time amount before they can join this channel.', style: text12Regular.copyWith(color: AppGrey.light500),),
                        value: access.paid,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: brandColor,

                      ),
                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      RadioListTile<access>(
                        title: Text('Level Unlock', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                        subtitle: Text('Access will be automatically granted when members attain a specified level.', style: text12Regular.copyWith(color: AppGrey.light500),),
                        value: access.levelUnlock,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: brandColor,

                      ),
                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      RadioListTile<access>(
                        title: Text('Selected Members Only', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                        subtitle: Text('Only selected members can access to this channel.', style: text12Regular.copyWith(color: AppGrey.light500),),
                        value: access.selectedMember,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: brandColor,

                      ),


                    ],
                  ),

                ),



              ),

              if(ac == access.public)...[

                SizedBox(height: 200,)

              ],


              if(ac == access.paid)...[

                SizedBox(height: 12,),

                Container(

                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                  ),

                  child:  _titleLog3('Amount (\$)'),


                ),

                SizedBox(height: 12,),

                Text('Please enter the amount you wish to receive from your member in order to gain access to this channel.', style: text12Regular.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Text('Channel Visibility', style: text12Medium.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),


                  child:  RadioGroup<member>(
                    groupValue: mm,
                    onChanged: (member? value) {

                      setState(() {
                        mm = value;
                      });
                    },


                    child: Column(
                      children: <Widget>[
                        RadioListTile<member>(
                          title: Text('Only Joined Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel only visible to channel members. Others won\'t see it in their listing.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.only,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,

                        ),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<member>(
                          title: Text('All Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel appears in the listing for everyone. Members can view its promotional page and choose to purchase or request access.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.all,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),

                      ],
                    ),

                  ),


                ),

                SizedBox(height: 40,),
              ],



              if(ac == access.levelUnlock)...[

                SizedBox(height: 12,),


                Container(

                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                ),


                  child: _titleLog('Select Level', 'None'),



                ),

                SizedBox(height: 12,),

                Text('Select the level you would like to grant access to this channel.', style: text12Regular.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Text('Channel Visibility', style: text12Medium.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),


                  child:  RadioGroup<member>(
                    groupValue: mm,
                    onChanged: (member? value) {

                      setState(() {
                        mm = value;
                      });
                    },


                    child: Column(
                      children: <Widget>[
                        RadioListTile<member>(
                          title: Text('Only Joined Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel only visible to channel members. Others won\'t see it in their listing.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.only,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,

                        ),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<member>(
                          title: Text('All Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel appears in the listing for everyone. Members can view its promotional page and choose to purchase or request access.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.all,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),

                      ],
                    ),

                  ),


                ),

                SizedBox(height: 40,),


              ],

              if(ac == access.selectedMember)...[


                SizedBox(height: 12,),


                Container(

                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                  ),


                  child: _titleLog2('Select Members', '0', onTap: () {


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MembersChannel()),
                    );

                  }),



                ),

                SizedBox(height: 12,),

                Text('Choose the members you wish to grant access to.', style: text12Regular.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Text('Channel Visibility', style: text12Medium.copyWith(color: AppGrey.light400),),

                SizedBox(height: 12,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),


                  child:  RadioGroup<member>(
                    groupValue: mm,
                    onChanged: (member? value) {

                      setState(() {
                        mm = value;
                      });
                    },


                    child: Column(
                      children: <Widget>[
                        RadioListTile<member>(
                          title: Text('Only Joined Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel only visible to channel members. Others won\'t see it in their listing.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.only,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,

                        ),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<member>(
                          title: Text('All Members', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                          subtitle: Text('This channel appears in the listing for everyone. Members can view its promotional page and choose to purchase or request access.', style: text12Regular.copyWith(color: AppGrey.light500),),
                          value: member.all,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),

                      ],
                    ),

                  ),


                ),

                SizedBox(height: 40,),

              ],
              //others


            ],

          ),
        ),

      ),
    );
  }

  ListTile _titleLog3(String title,  {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing:SizedBox(
        width: 80,
        child: TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: '5.00',
            hintStyle: text14Regular.copyWith(color: AppGrey.light300),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: text14Regular.copyWith(color: AppGrey.light400),
        ),
      ),
    );
  }

  ListTile _titleLog(String title, String value, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing:  Row(
        mainAxisSize: MainAxisSize.min, // 👈 This is the key fix
        children: [
          Text(value, style: text14Regular.copyWith(color: AppGrey.light400)),
          Icon(Icons.unfold_more, size: 16, color: AppGrey.light300),
        ],
      ),
    );
  }


  ListTile _titleLog2(String title, String value, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Text( // 👈 Use title not leading
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
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
}