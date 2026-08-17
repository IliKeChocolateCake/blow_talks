import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



class FollowerFollowing extends StatefulWidget{

  final int finalIndex;
  const FollowerFollowing ({super.key, required this.finalIndex});

  @override
  State<FollowerFollowing> createState() => FollowerFollowingPage();

}



class FollowerFollowingPage extends State<FollowerFollowing>{
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 2,
      initialIndex: widget.finalIndex,
      child: Scaffold(

      backgroundColor: isDarkMode(context)?AppGrey.dark50: AppGrey.light50,


      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal:0),

        child: Column(

          children: [

            Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),


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
                      child: Text('Sofia Martinez', style: text16Bold.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain)),
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


            TabBar(

              indicatorColor: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain,
              unselectedLabelStyle: text14Regular,
              unselectedLabelColor: isDarkMode(context)? AppGrey.dark500:AppGrey.light500,
              labelColor: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain,
              labelStyle: text14Medium,
              tabs: <Widget>[
                Tab(text: 'Followers',),
                Tab(text: 'Following',),
              ],
            ),

            Expanded(child: TabBarView(
              children: <Widget>[
                Center(child: Follower()),
                Center(child: Following()),
              ],
            ),),
          ],

        ),

      ),),


    ),

    );
  }



}


class Follower extends StatelessWidget{
  const Follower({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(

        child: Column(

          children: [


            followerList(true, true,'asset/classroom/enroll/alice.png', 'Alice Yap', '@aliceyap34', 'Passionate about tech, travel, and tasty food. Let\'s connect and explore together!', context),
            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),
            followerList(false, false,'asset/classroom/enroll/brian.png', 'Brian Lee', '@brianlee223', 'UX Designer. Coffee lover. Always exploring new ideas and places.', context),
            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),
            followerList(false, true,'', 'Chloe Kim', '@kim_349', 'Avid tech enthusiast exploring the intersection of design and innovation. Let\'s connect and shape the future!', context),
            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),

            followerList(true, false, 'asset/classroom/enroll/david.png', 'David Lee', '@davidlee09', 'Tech lover, let’s build something amazing together!', context),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),


            followerList(false, true, 'asset/classroom/enroll/emily.png', 'Emily Watson', '@emilywatson.1030', 'Driven by a love for tech and design.', context),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),

            followerList(true, true,'', 'Grace Wu', '@graceluvcoffee', 'Passionate about leveraging technology to create impactful user experiences.', context),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
              thickness: 1,
            ),

          ],
        ),

      ),
    );
  }


  InkWell followerList (bool followBack, bool online, String imageAvatar, String username, String alias, String sub, BuildContext context){

    return InkWell(

      child: ListTile(

        leading: Stack(

          children: [
            (imageAvatar.isEmpty)? CircleAvatar(
              radius: 26,
              backgroundColor: brandColor.shade100,
              child: Icon(Icons.person, color: brandColor, size: 28),
            ) :
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(imageAvatar),
            ),

            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: (online)? Colors.green : AppGrey.light300,
                  shape: BoxShape.circle,

                ),
              ),
            ),

          ],

        ),
        title: Row(

          children: [


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
                Text(alias, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500),),
              ],
            ),

            Spacer(),

            //condition

            (followBack) ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppGrey.light50,
                foregroundColor: Colors.white,
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                side: BorderSide(color: AppGrey.light300, width: 1), // 👈
                elevation: 0,
              ),
              child: Text('Message', style: text14Regular.copyWith(color: AppGrey.lightMain)),
            ) : ElevatedButton(
          onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: brandColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(88, 32),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 0,
      ),
      child: Text('Follow back', style: text14Regular),
    ),


            SizedBox(

              height: 32,
              width: 32,

              child: Icon(Icons.more_horiz, color: AppGrey.light400, size: 18,),

            ),


          ],
        ),

        subtitle: Text(sub, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),
        
        
      ),


    );

  }
  
}


class Following extends StatelessWidget{
  const Following({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(


     backgroundColor: Colors.transparent,

     body: SingleChildScrollView(

       child: Column(

         children: [

           
           followingList(true, 'asset/classroom/enroll/jamie.png', 'Jamie Smith', '@jamiesmith22', 'Passionate about innovative technologies and their real-world applications.', context),

           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),
           followingList(false, 'asset/classroom/enroll/kevin.png', 'Kevin Martin', '@kevinmartin89', 'Software engineer. Coffee enthusiast. Exploring the intersection of code and creativity.', context),

           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),

           followingList(false, 'asset/classroom/enroll/ashley.png', 'Ashley Johnson', '@ashleyj_design', 'Marketing specialist. Data driven. Let\'s connect and grow together!', context),


           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),

           followingList(true, '', 'Michael Brown', '@michael_brown42', 'Full-stack developer. Always learning. Let\'s innovate and create!', context),


           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),

           followingList(true, 'asset/classroom/enroll/jessica.png', 'Jessica Davis', '@jessicadavis_ux', 'Passionate about leveraging data to drive informed decisions.', context),


           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),

           followingList(true, '', 'Tiffany Chen', '@tiffchen_design', 'Passionate about leveraging technology to create impactful user experiences.', context),

           Divider(
             color: isDarkMode(context)? AppGrey.dark200:AppGrey.light200,
             thickness: 1,
           ),
         ],
       ),
     ),


   );
  }


  InkWell followingList (bool online, String imageAvatar, String username, String alias, String sub, BuildContext context) {

    return InkWell(

      child: ListTile(

        leading: Stack(

          children: [
            (imageAvatar.isEmpty)? CircleAvatar(
              radius: 26,
              backgroundColor: brandColor.shade100,
              child: Icon(Icons.person, color: brandColor, size: 28),
            ) :
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(imageAvatar),
            ),

            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: (online)? Colors.green : AppGrey.light300,
                  shape: BoxShape.circle,

                ),
              ),
            ),

          ],

        ),
        title: Row(

          children: [


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: text14Medium.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),),
                Text(alias, style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500: AppGrey.light500),),
              ],
            ),

            Spacer(),

            //condition

             ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppGrey.light50,
                foregroundColor: Colors.white,
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                side: BorderSide(color: AppGrey.light300, width: 1), // 👈
                elevation: 0,
              ),
              child: Text('Message', style: text14Regular.copyWith(color: AppGrey.lightMain)),
            ),


            SizedBox(

              height: 32,
              width: 32,

              child: Icon(Icons.more_horiz, color: AppGrey.light400, size: 18,),

            ),


          ],
        ),

        subtitle: Text(sub, style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),),


      ),


    );



  }
  
  
}