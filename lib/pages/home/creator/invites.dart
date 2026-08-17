import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';

class Invites extends StatefulWidget{

  const Invites ({super.key});

  @override
  State<Invites> createState() => InvitesPage();


}


class InvitesPage extends State<Invites>{

  bool pauseInvite = true;

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
                        child: Text('Invites', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                      ),
                    ),


                  ],
                ),
              ),
            
              
              Container(


                width: double.infinity,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),


                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    _toggleTile(
                      title: 'Pause All Invites',
                      subtitle: 'Users cannot join the community using the created invite link.',
                      value: pauseInvite,
                      onChanged: (v) => setState(() => pauseInvite = v),
                    ),


                  ],
                ),

              ),

              SizedBox(height: 16,),

              inviteCard(
                neverExpiry: false,
                code: '8J029D83',
                expiry: '06:23:50:40',
                creatorName: 'Jason (Creator)',
                creatorAvatar: 'asset/classroom/enroll/brian.png',
                used: 0,
                total: 10,
                onMore: () {
                  // show options menu
                },
              ),


              SizedBox(height: 16,),

              inviteCard(
                neverExpiry: false,
                code: 'A4B1C2D3',
                expiry: '04:08:15:55',
                creatorName: 'Melissa',
                creatorAvatar: 'asset/discussion/ying.png',
                used: 3,
                total: 10,
                onMore: () {
                  // show options menu
                },
              ),



              SizedBox(height: 16,),

              inviteCard(
                neverExpiry: true,
                code: 'E5F6G7H8',
                expiry: 'Never Expiry',
                creatorName: 'Johnson Tan',
                creatorAvatar: 'asset/discussion/zara.png',
                used: 2,
                total: 10,
                onMore: () {
                  // show options menu
                },
              ),


            ],
          ),
        ),

      ),
    );
  }

  Widget inviteCard({
    required String code,
    required String expiry,
    required String creatorName,
    required String? creatorAvatar,
    required int used,
    required int total,
    required bool neverExpiry,
    VoidCallback? onMore,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Code + usage count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(code, style: text14Bold.copyWith(color: AppGrey.lightMain)),
              Text('$used/$total', style: text12Regular.copyWith(color: AppGrey.light400)),
            ],
          ),

          const SizedBox(height: 2),

          // Expiry
          (neverExpiry) ?
          Text(
            expiry,
            style: text12Regular.copyWith(color: AppGrey.light400),
          ) :
          Text(
            'Expire in $expiry',
            style: text12Regular.copyWith(color: AppGrey.light400),
          ),



          const SizedBox(height: 24),

          // Creator row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  creatorAvatar != null
                      ? CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(creatorAvatar),
                  )
                      : CircleAvatar(
                    radius: 12,
                    backgroundColor: brandColor.shade100,
                    child: Icon(Icons.person, color: brandColor, size: 12),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    creatorName,
                    style: text12Regular.copyWith(color: AppGrey.lightMain),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onMore,
                child: Icon(Icons.more_horiz, color: AppGrey.light400, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: text12Regular.copyWith(color: AppGrey.light500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,


            inactiveThumbColor: Colors.white,

            // ── Track ──
            activeTrackColor: const Color(0xff0AAB83),
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