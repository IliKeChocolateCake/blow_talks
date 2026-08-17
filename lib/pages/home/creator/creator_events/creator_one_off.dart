import 'package:blow_talks/pages/home/general_inquiry/classroom/member/enroll.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';



class CreatorOneOff extends StatefulWidget{
  
  const CreatorOneOff({super.key});
  
  @override
  State<CreatorOneOff> createState() => OneOffPage();
  

}


class OneOffPage extends State<CreatorOneOff>{

  Color _dominantColor = Colors.grey;
  Color _secondaryColor = Colors.black;

  final ScrollController _scrollController = ScrollController(); // 👈 Add this
  bool _showTitle = false; // 👈 Add this

  @override
  void initState() {
    super.initState();
    _generatePalette();

    // 👇 Add this
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) { // Adjust 200 to when you want title to appear
        if (!_showTitle) setState(() => _showTitle = true);
      } else {
        if (_showTitle) setState(() => _showTitle = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 👈 Add this
    super.dispose();
  }



  Future<void> _generatePalette() async {
    final paletteGenerator = await PaletteGeneratorMaster.fromImageProvider(
      AssetImage('asset/events/dance.png'),
    );

    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.purple;
      _secondaryColor = paletteGenerator.vibrantColor?.color ?? _dominantColor;
    });
  }


  PopupMenuItem<String> _menuItem(String label, Color color) {
    return PopupMenuItem<String>(

      value: label,
      child: Text(
        label,
        style: text14Regular.copyWith(color: color),
      ),
    );
  }

  PopupMenuEntry<String> _dividerItem() { // 👈 Change return type
    return PopupMenuDivider(height: 1);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Container(


        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _secondaryColor,   // vibrant color from image
              _dominantColor,    // dominant color from image
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),

        child: Stack(

          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withValues(alpha: 0.5),
            ),




            CustomScrollView(

              controller: _scrollController,


              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: InkWell(
                    onTap: () { Navigator.pop(context); },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.26),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.26),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(

                        onTap: () {
                          final RenderBox button = context.findRenderObject() as RenderBox;
                          final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
                          final RelativeRect position = RelativeRect.fromRect(
                            Rect.fromPoints(
                              button.localToGlobal(Offset.zero, ancestor: overlay),
                              button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
                            ),
                            Offset.zero & overlay.size,
                          );

                          showMenu<String>(

                            context: context,
                            position: RelativeRect.fromLTRB(20, 100, 0, 0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Colors.white.withValues(alpha: 0.8),
                            items: <PopupMenuEntry<String>>[ // 👈 Add explicit type here
                              _menuItem('Edit Event', AppGrey.lightMain),
                              _menuItem('Edit Session', AppGrey.lightMain),
                              _menuItem('Edit Series', AppGrey.lightMain),
                              _dividerItem(),
                              _menuItem('Share',AppGrey.lightMain),
                              _menuItem('Add to Calendar',AppGrey.lightMain),
                              _dividerItem(),
                              _menuItem('Cancel Event', Colors.red),
                              _menuItem('Cancel Session', Colors.red),
                              _menuItem('Cancel Series', Colors.red),
                            ],
                          );
                        },
                        child:Icon(Icons.more_horiz, color: Colors.white, size: 24),
                      ),
                    ),
                  ],


                  title: AnimatedOpacity(
                    opacity: _showTitle ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      'Coffee & Books',
                      style: text14Regular.copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('asset/events/dance.png'),
                        SizedBox(height: 20),
                        Text('Dance the Night Away Party', style: text24Bold.copyWith(color: Colors.white)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundImage: AssetImage('asset/classroom/enroll/ivy.png'),
                            ),
                            SizedBox(width: 8),
                            Wrap(
                              children: [
                                Text('Christine Chan', style: text12Medium.copyWith(color: Colors.white)),
                                Text(' created this event.', style: text12Regular.copyWith(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        eventDetails(Icons.access_time, 'Fri, 22 Aug 2025', '08:00 PM ~ 12:00 AM'),
                        SizedBox(height: 12),
                        eventDetails(Icons.location_on_outlined, 'Location', '3966 Watson Street, Newark, New Jersey, 07102'),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppGrey.light50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                                side: BorderSide(color: AppGrey.light300),
                              ),
                              elevation: 0,
                            ),
                            child: Text('Attend this Event', style: text14Regular.copyWith(color: AppGrey.lightMain)),
                          ),
                        ),
                        SizedBox(height: 32),
                        Text('123 ARE GOING', style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4))),
                        Divider(color: Colors.white.withValues(alpha: 0.2), thickness: 1),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const Enroll()));
                          },
                          child: Image.asset('asset/classroom/avatars.png'),
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text('Tan Jia Mei, Christine Yang, Tan Kelly, Chong Sanna, and', style: text14Medium.copyWith(color: Colors.white)),
                            Text('119 more', style: text14Bold.copyWith(color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 2.0,
                            )),
                          ],
                        ),
                        SizedBox(height: 32),
                        Text('ABOUT THIS EVENT', style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4))),
                        Divider(color: Colors.white.withValues(alpha: 0.2), thickness: 1),
                        SizedBox(height: 16),
                        Text('We invite you to participate in our exciting annual offline meetup, where you can connect with fellow enthusiasts, share ideas, and engage in meaningful discussions. This event promises to be a fantastic opportunity to network, learn from one another, and enjoy a day filled with inspiring activities and presentations. ', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n2:00 PM - 3:00 PM: \nRegistration and Welcome Drinks', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n3:00 PM - 4:30 PM:  \nKeynote Presentation', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n4:30 PM - 5:00 PM: \nNetworking Break ', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n5:00 PM - 6:30 PM: \nPanel Discussion  ', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n6:30 PM - 7:30 PM:  \nInteractive Workshops', style: text14Regular.copyWith(color: Colors.white)),
                        Text('\n7:30 PM - 8:00 PM: \nClosing Remarks and Farewell', style: text14Regular.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],




            ),


          ],
        ),
      ),

    );
  }


  InkWell eventDetails (IconData icon, String paymentTitle, String description){

    return InkWell(

      child: Container(
        padding: EdgeInsets.all(16),

        decoration: BoxDecoration(

          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),


        ),

        child: ListTile(

          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),

            decoration: BoxDecoration(

              color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),

            ),
            child: Icon(icon, color: Colors.white,),
          ),


          title: Text(paymentTitle, style: text14Regular.copyWith(color: Colors.white.withValues(alpha: 0.7)),),
          subtitle: Text(description, style: text14Regular.copyWith(color: Colors.white),),
        ),


      ),

    );
  }
  
}