import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/chat/message.dart';
import 'package:blow_talks/pages/chat/start_chat.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';





class ChatMain extends StatefulWidget {
  const ChatMain({super.key});

  @override
  State<ChatMain> createState() => ChatMainPage();
}

class ChatMainPage extends State<ChatMain> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Tan Mei Mei',
      'message': 'Where should we meet?',
      'time': '9:44 PM',
      'unread': 0,
      'online': true,
      'avatar': 'asset/chat/mei.png',
      'badge_image': null,
    },
    {
      'name': 'James Brown',
      'message': 'Content consistency really matters too!',
      'time': '8:30 PM',
      'unread': 3,
      'online': true,
      'avatar': null,
      'badge_image': null,
    },
    {
      'name': '#General Inquiry',
      'message': "I don't know just wonder if anyone feel the same",
      'time': '8:15 PM',
      'unread': 12,
      'online': false,
      'avatar': 'asset/chat/general.png',
      'badge_image': 'asset/icon/community/hub.png',
    },
    {
      'name': 'Seline Yong',
      'message': 'Engagement is key! I try to interact daily.',
      'time': 'Tue',
      'unread': 0,
      'online': true,
      'avatar': 'asset/chat/seline.png',
      'badge_image': null,
    },
    {
      'name': 'Liam Smith',
      'message': "That's fantastic! Do you have any specific tips or strategies that could help with growing? I'd love t...",
      'time': 'Mon',
      'unread': 0,
      'online': false,
      'avatar': 'asset/chat/liam.png',
      'badge_image': null,
    },
    {
      'name': 'Sophia',
      'message': "It's going well! I just hit 500 followers.",
      'time': '2/10/2025',
      'unread': 0,
      'online': true,
      'avatar': 'asset/chat/sophia.png',
      'badge_image': null,
    },
    {
      'name': 'Noah Davis',
      'message': "Ahh I see, how's your socials going so far?",
      'time': '2/10/2025',
      'unread': 0,
      'online': false,
      'avatar': 'asset/chat/noah.png',
      'badge_image': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            // Header
            Padding(padding: EdgeInsets.symmetric(vertical: 20),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Chats (7)', style: text24Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),
                  InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => StartChat()),
                      );


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
                        child: Icon(Icons.add, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            // const SizedBox(height: 20),

            // Chat list
            Expanded(
              child: ListView.separated(
                itemCount: chats.length,
                separatorBuilder: (_, _) => Divider(height: 1, color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return _ChatTile(chat: chat);
                },
              ),
            ),
          ],
        ),
      ),),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final Map<String, dynamic> chat;


  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(

        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Message()),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                chat['avatar'] != null
                    ? CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(chat['avatar']),
                )
                    : CircleAvatar(
                  radius: 26,
                  backgroundColor: brandColor.shade100,
                  child: Icon(Icons.person, color: brandColor, size: 28),
                ),

                Positioned(
                  bottom: 1,
                  right: 1,
                  child: chat['badge_image'] != null
                      ? Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: AssetImage(chat['badge_image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      : Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: chat['online'] ? Colors.green : AppGrey.light300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),


              ],
            ),
            const SizedBox(width: 12),

            // Name + message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat['name'],
                    style: text14Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    chat['message'],
                    style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Time + unread badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: text14Regular.copyWith(color: isDarkMode(context)? AppGrey.dark300:AppGrey.light300, fontSize: 12),
                ),
                const SizedBox(height: 4),
                if (chat['unread'] > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: brandColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '${chat['unread']}',
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}