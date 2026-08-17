import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class ChannelCategoryBottomsheet extends StatefulWidget{
  
  const ChannelCategoryBottomsheet ({super.key});
  
  @override
  State<ChannelCategoryBottomsheet> createState() => ChannelCategoryPage();
}

class ChannelCategoryPage extends State<ChannelCategoryBottomsheet>{
  @override
  Widget build(BuildContext context) {
    return ClipRRect(

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),

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

                      child: Text('Category', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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


              SizedBox(height: 12,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),


                ),

                child: Column(

                  children: [


                    _titleLog('General'),
                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                    _titleLog2('AI Wellness 🧘'),
                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                    _titleLog2('AI in Trading 📈'),
                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                    _titleLog2('AI in Finance 💰'),
                  ],
                ),

              ),


            ],

          ),
        ),
    );
  }


  ListTile _titleLog(String title, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),

      onTap: onTap,

      trailing: Icon(Icons.check, size: 16, color: brandColor,),
    );
  }

  ListTile _titleLog2(String title, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),

      onTap: onTap,

    );
  }
}