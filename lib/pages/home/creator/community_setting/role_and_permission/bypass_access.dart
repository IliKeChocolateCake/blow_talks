import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BypassAccess extends StatefulWidget{

  const BypassAccess ({super.key});

  @override
  State<BypassAccess> createState() => BypassAccessPage();

}



class BypassAccessPage extends State<BypassAccess>{

  bool isExpanded=true;
  bool isWell=true;
  bool isTrading = true;
  bool isFinance=true;


  bool generalInquiry = true;
  bool studyAI = true;
  bool ethicDiscussion =false;


  bool embraceAI = true;
  bool selfHelp = true;
  bool wellChallenge=true;


  bool trading = true;
  bool stockAnalysis = true;
  bool tradingChallenge = false;






  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Container(

               padding: EdgeInsets.all(20),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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

                      child: Text('Bypass Access', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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


              Text('Members from this role can bypass the access for selected private channel (Paid, Selected Member Only, and Level Unlock Channel)',
                style: text12Regular.copyWith(color: AppGrey.light400),
              ),


              SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('General', style: text12Medium.copyWith(color:AppGrey.light400)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded; // toggle
                      });
                    },
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppGrey.light300, size: 16,
                    ),
                  ),
                ],
              ),

              if(isExpanded)...[

                SizedBox(height: 12,),

                Container(


                  width: double.infinity,

                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),


                  ),

                  child: Column(

                    //toggle screen if true make it appear on the list and vice versa.
                    children: [
                      _toggleTile(title: 'General Inquiry', icons: Icons.language, value: generalInquiry,
                        onChanged: (v) => setState(() => generalInquiry = v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile(title: 'Study Collaborative AI Learning', icons: Icons.language, value: studyAI,
                        onChanged: (v) => setState(() => studyAI = v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile2(title: 'AI Ethics Discussions', icons: Icons.lock_outline, value: ethicDiscussion,
                        onChanged: (v) => setState(() => ethicDiscussion = v),),


                    ],

                  ),

                ),



              ],


              SizedBox(height: 16,),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('AI Wellness 🧘', style: text12Medium.copyWith(color:AppGrey.light400)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isWell = !isWell; // toggle
                      });
                    },
                    icon: Icon(
                      isWell
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppGrey.light300, size: 16,
                    ),
                  ),
                ],
              ),

              if(isWell)...[

                SizedBox(height: 12,),


                Container(


                  width: double.infinity,

                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),


                  ),

                  child: Column(

                    children: [
                      _toggleTile(title: 'Embrace AI', icons: Icons.language, value:embraceAI,
                        onChanged: (v) => setState(() => embraceAI = v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile(title: 'AI in Self-Help Literature', icons: Icons.language, value: selfHelp,
                        onChanged: (v) => setState(() => selfHelp = v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile2(title: '30-Day AI Wellness Challenge', icons: Icons.lock_outline, value: wellChallenge,
                        onChanged: (v) => setState(() => wellChallenge= v),),


                    ],

                  ),

                ),

              ],

              SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('AI in Trading 📈', style: text12Medium.copyWith(color:AppGrey.light400)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isTrading = ! isTrading; // toggle
                      });
                    },
                    icon: Icon(
                      isTrading
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppGrey.light300, size: 16,
                    ),
                  ),
                ],
              ),

              if(isTrading)...[

                SizedBox(height: 12,),


                Container(


                  width: double.infinity,

                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),


                  ),

                  child: Column(

                    children: [
                      _toggleTile(title: 'Algorithmic Trading', icons: Icons.language, value:trading,
                        onChanged: (v) => setState(() => trading= v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile(title: 'AI Stock Analysis', icons: Icons.language, value: stockAnalysis,
                        onChanged: (v) => setState(() => stockAnalysis = v),),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      _toggleTile2(title: '7-Day AI Trading Challenge', icons: Icons.lock_outline, value: tradingChallenge,
                        onChanged: (v) => setState(() => tradingChallenge= v),),


                    ],

                  ),

                ),


              ],






            ],
          ),

        ),

      ),

    );
  }


  Widget _toggleTile({
    required String title,
    required IconData icons,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icons, size: 16, color: AppGrey.light500,),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain), maxLines: 1, overflow:TextOverflow.ellipsis,),

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
            activeTrackColor: brandColor.withValues(alpha: 0.4),
            inactiveTrackColor: AppFixed.lightGrey,

            // ── Track border ──
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return brandColor.withValues(alpha: 0.4); // no border when active
              }
              return AppFixed.lightGrey; // border color when inactive
            }),




          ),
        ],
      ),
    );



  }


  Widget _toggleTile2({
    required String title,
    required IconData icons,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icons, size: 16, color: AppGrey.light500,),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain), maxLines: 1, overflow:TextOverflow.ellipsis,),

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