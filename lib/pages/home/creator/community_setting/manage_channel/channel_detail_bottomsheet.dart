import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/access_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/channel_category_bottomsheet.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/content_type_bottomsheet.dart';
import 'package:flutter/material.dart';



class ChannelDetailBottomsheet extends StatefulWidget{

  final String name;

  const ChannelDetailBottomsheet ({super.key, required this.name});
  
  
  @override
  State<ChannelDetailBottomsheet> createState() => ChannelDetailBottomsheetPage();

}

class ChannelDetailBottomsheetPage extends State<ChannelDetailBottomsheet>{

  TextEditingController get _nameController => TextEditingController(text: widget.name);
  final TextEditingController _bioController = TextEditingController(
    text:
    'Welcome to AI Hub! This is a space for AI enthusiasts to connect, share ideas, and explore the latest advancements in artificial intelligence.',
  );
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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

                      child: Text('Channel Detail', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

              Text('Channel Name', style: text12Regular.copyWith(color: AppGrey.light600)),
              const SizedBox(height: 6),
              TextField(
                controller: _nameController,
                style: text14Regular.copyWith(color: AppGrey.lightMain),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.check, color: brandColor, size: 20),
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

                    _titleLog('Category','None', onTap: (){

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.8,
                          child: ChannelCategoryBottomsheet(),  // 👈 Pass label
                        ),
                      );

                    }),

                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),

                    _titleLog('Access Type','Public', onTap: () {

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.8,
                          child: AccessTypeBottomsheet(),  // 👈 Pass label
                        ),
                      );

                    }),

                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),

                    _titleLog('Members','0', onTap: (){


                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => MembersChannel()),
                      // );

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

                    _titleLog('Content Type','1', onTap: (){

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.8,
                          child: ContentType(),  // 👈 Pass label
                        ),
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
                    'Delete Plan',
                    style: text14Regular.copyWith(color: AppAlert.lightError500),
                  ),


                ),

              ),





            ],
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

}