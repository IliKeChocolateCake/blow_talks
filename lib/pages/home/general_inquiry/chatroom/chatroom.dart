
import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/content_type_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class Chatroom extends StatefulWidget{

  const Chatroom  ({super.key});

  @override
  State<Chatroom> createState() => ChatroomPage();


}


class ChatroomPage extends State<Chatroom>{
  final _chatController = InMemoryChatController();
  final _composerController = TextEditingController(); // 👈 new

  void _onSendPressed() {
    final text = _composerController.text.trim();
    if (text.isEmpty) return;

    _chatController.insertMessage(
      TextMessage(
        id: '${Random().nextInt(100000) + 1}',
        authorId: 'user1',
        createdAt: DateTime.now().toUtc(),
        text: text,
      ),
    );
    _composerController.clear();
  }
  @override
  void initState() {
    super.initState();
    _seedMessages();
  }

  @override
  void dispose() {
    _chatController.dispose();
    _composerController.dispose();
    super.dispose();
  }

  final Map<String, _ChatUser> _users = {
    'user1': _ChatUser(
      name: 'You',
      avatar: null,
      status: 'BEGINNER',
      bgColor: brandColor.withValues(alpha: 0.1),
      iconColor: brandColor,
      textColor: brandColor,
      borderColor: brandColor,
    ),
    'user2': _ChatUser(
      name: 'Jason Maze',
      avatar: 'asset/classroom/enroll/henry.png',
      status: 'EXPLORER',
      bgColor: AppOthers.lightNeonGreenTransparent,
      iconColor: Colors.green,
      textColor: AppOthers.lightNeonGreenMain,
      borderColor: AppOthers.lightNeonGreenMain,
    ),
    'user3': _ChatUser(
      name: 'Susan Yang',
      avatar: 'asset/classroom/enroll/emily.png',
      status: 'BEGINNER',
      bgColor: brandColor.withValues(alpha: 0.1),
      iconColor: brandColor,
      textColor: brandColor,
      borderColor: brandColor,
    ),
    'user4': _ChatUser(
      name: 'Jen Martinez',
      avatar: 'asset/classroom/enroll/ivy.png',
      status: 'MASTER',
      bgColor: AppOthers.lightPinkTransparent,
      iconColor: AppOthers.lightPinkMain,
      textColor: AppOthers.lightPinkMain,
      borderColor: AppOthers.lightPinkMain,
    ),
  };


  void _seedMessages() {
    final messages = [
      TextMessage(
        id: '1',
        authorId: 'user2',
        text: 'I did try ChatGPT and I’m not really into its new model.',
      ),
      SystemMessage(
        id: 'divider-1',
        authorId: 'system',
        createdAt: DateTime.now().subtract(const Duration(hours: 23)).toUtc(),
        text: 'YESTERDAY 04:22 PM',
      ),

      TextMessage(
        id: '2',
        authorId: 'user3',
        text: 'What AI tools you guys used to run customer research?',
      ),
      TextMessage(
        id: '3',
        authorId: 'user4',
        text: "I've been using LumenAI for customer segmentation. It's been a game changer!",
        replyToMessageId: '2'
      ),
      SystemMessage(
        id: 'divider-2',
        authorId: 'system',
        createdAt: DateTime.now().subtract(const Duration(hours: 23)).toUtc(),
        text: 'YESTERDAY 09:39 PM',
      ),
      TextMessage(
        id: '4',
        authorId: 'user1',
        text: "Recommend using Quantilope!",
        replyToMessageId: '2'
      ),




    ];

    for (final message in messages) {
      _chatController.insertMessage(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Container(

        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
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
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('General Inquiry', style: text16Bold),
                          InkWell(
                            onTap: () {

                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                barrierColor: Colors.black.withValues(alpha: 0.5),
                                backgroundColor: Colors.transparent,
                                builder: (context) => FractionallySizedBox(
                                  heightFactor: 0.5, // 90% height
                                  child: const ContentTypeBottomsheet(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Chatroom', style: text12Regular.copyWith(color: Colors.grey)),
                                Icon(Icons.unfold_more, size: 12, color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 44),
                  ],
                ),
              ),



              // ── Scrollable content ──
              Expanded(
                child: Chat(

                  builders: Builders(
                    systemMessageBuilder: (context, message, index, {groupStatus, required isSentByMe}) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            message.text,
                            style: text12Regular.copyWith(color: AppGrey.light300),
                          ),
                        ),
                      );
                    },
                    textMessageBuilder: (context, message, index, {groupStatus, required isSentByMe}) {
                      final user = _users[message.authorId];
                      final name = user?.name ?? message.authorId;
                      final avatar = user?.avatar;

                      String? repliedText;
                      if (message.replyToMessageId != null) {
                        final repliedMessage = _chatController.messages
                            .where((m) => m.id == message.replyToMessageId)
                            .firstOrNull;
                        if (repliedMessage is TextMessage) {
                          repliedText = repliedMessage.text;
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [

                            // Avatar + Name (received only)
                            if (!isSentByMe)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    avatar != null
                                        ? CircleAvatar(
                                      radius: 14,
                                      backgroundImage: AssetImage(avatar),
                                    )
                                        : CircleAvatar(
                                      radius: 14,
                                      backgroundColor: brandColor.shade100,
                                      child: Icon(Icons.person, color: brandColor, size: 14),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(name, style: text12Medium.copyWith(color: AppGrey.lightMain)),
                                    const SizedBox(width: 6),
                                    if (user != null)
                                      _buildBadge(
                                        user.status,
                                        Icons.diamond,
                                        user.bgColor,
                                        user.iconColor,
                                        user.textColor,
                                        user.borderColor,
                                      ),
                                  ],
                                ),
                              ),

                            // "You replied" label (sent reply only)
                            if (isSentByMe && repliedText != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  'You replied',
                                  style: text12Regular.copyWith(color: AppGrey.light400),
                                ),
                              ),

                            // Bubble
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSentByMe ? brandColor : AppGrey.light200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (repliedText != null)
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 6),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isSentByMe ? AppGrey.light200 : Color(0xFF4CAF93),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border(
                                          left: BorderSide(
                                            color: AppGrey.light300,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        repliedText,
                                        style: text14Regular.copyWith(
                                          color: isSentByMe ? AppGrey.lightMain : Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  Text(
                                    message.text,
                                    style: text14Regular.copyWith(
                                      color: isSentByMe ? Colors.white : AppGrey.lightMain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    composerBuilder: (context) => Align(
                      alignment: Alignment.bottomCenter,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  // your attachment logic here
                                },
                                icon: const Icon(Icons.add, color: Colors.black87),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: _composerController,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff0AAB83),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: _onSendPressed,
                                          icon: const Icon(Icons.arrow_upward,
                                              color: Colors.white, size: 18),
                                        ),
                                      ),
                                    ),
                                    hintText: 'Say Something',
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(color: Colors.transparent),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                  ),
                                  onSubmitted: (_) => _onSendPressed(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  chatController: _chatController,
                  currentUserId: 'user1',
                  theme: ChatTheme(
                    colors: ChatColors(
                      primary: const Color(0xFF4CAF93),           // sent bubble (green)
                      onPrimary: Colors.white,                      // text on sent bubble
                      surface: const Color(0xFFF0F0F0),             // overall chat background
                      onSurface: Colors.black87,                    // default text color
                      surfaceContainer: const Color(0xFFEDEDED),    // received bubble background
                      surfaceContainerLow: const Color(0xFFF5F5F5), // lighter variant (e.g. composer bg)
                      surfaceContainerHigh: const Color(0xFFE0E0E0),// darker variant (e.g. hover/pressed states)
                    ),
                    typography: ChatTheme.light().typography,  // keep default typography for now
                    shape: ChatTheme.light().shape,            // keep default shape for now
                  ),
                  onMessageSend: (text) {


                    _chatController.insertMessage(
                      TextMessage(
                        id: '${Random().nextInt(1000) + 1}',
                        authorId: 'user1',
                        createdAt: DateTime.now().toUtc(),
                        text: text,
                      ),
                    );
                  },
                  resolveUser: (UserID id) async {
                    return User(id: id, name: 'John Doe');
                  },
                ),
              ),


            ],
          ),
        ),







      ),
    );
  }

  InkWell members( String? avatarImage, String username, String memberStatus, String location, Color backgroundColor, Color iconColor, Color textColor, Color borderColor, bool online, String alias){

    return InkWell(

      onTap: (){

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => MemberFeed(name: username, image: avatarImage,alias: alias,)),
        // );
      },

      child: Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),


        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(

              children: [

                avatarImage != null ?
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(avatarImage),
                ) : CircleAvatar(
                  radius: 26,
                  backgroundColor: brandColor.shade100,
                  child: Icon(Icons.person, color: brandColor, size: 28),
                ),

                Positioned(
                  bottom: 1,
                  right: 1,

                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: online ? Colors.green : AppGrey.light300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(username, style: text14Medium.copyWith(color: AppGrey.lightMain),),
                      SizedBox(width: 8),
                      _buildBadge(memberStatus, Icons.diamond, backgroundColor, iconColor,textColor, borderColor),

                    ],
                  ),
                  SizedBox(height: 4),
                  Row(

                    children: [

                      Icon(Icons.location_on_outlined, size: 14, color: AppGrey.light400,),

                      Text(
                        location,
                        style: text12Medium.copyWith(color: AppGrey.light500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],

                  ),

                ],
              ),
            ),
          ],
        ),

      ),

    );
  }


  Widget _buildBadge(String label, IconData icon, Color backgroundColor, Color iconColor, Color textColor, Color borderColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor, // your border color here
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: iconColor),
          SizedBox(width: 4),
          Text(label, style: text10Medium.copyWith(color: textColor)),
        ],
      ),
    );
  }
}


class _ChatUser {
  final String name;
  final String? avatar;
  final String status;
  final Color bgColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  _ChatUser({
    required this.name,
    this.avatar,
    required this.status,
    required this.bgColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
  });
}
