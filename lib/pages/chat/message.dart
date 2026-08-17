import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class Message extends StatefulWidget{

  const Message ({super.key});
  
  
  @override
  State<Message> createState() => MessagePage();


}


class MessagePage extends State<Message>{
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

  void _seedMessages() {
    final messages = [
      TextMessage(
        id: '1',
        authorId: 'user1',
        text: 'Would love to learn',
      ),
      SystemMessage(
        id: 'divider-1',
        authorId: 'system',
        createdAt: DateTime.now().subtract(const Duration(hours: 23)).toUtc(),
        text: 'YESTERDAY 04:22 PM',
      ),

      TextMessage(
        id: '2',
        authorId: 'user2',
        text: 'Yeah sure!',
      ),
      TextMessage(
        id: '3',
        authorId: 'user2',
        text: "Let's meet up on this Tuesday, can't wait to share the knowledge with you",
      ),
      TextMessage(
        id: '4',
        authorId: 'user2',
        text: "I'm looking forward to our discussion, it will be great to brainstorm together.",
      ),
      TextMessage(
        id: '5',
        authorId: 'user2',
        replyToMessageId: '1', // 👈 replies to "Would love to learn"
        text: 'Happy to hear that <3',
      ),
      SystemMessage(
        id: 'divider-2',
        authorId: 'system',
        createdAt: DateTime.now().subtract(const Duration(hours: 23)).toUtc(),
        text: 'YESTERDAY 09:39 PM',
      ),
      TextMessage(
        id: '6',
        authorId: 'user1',
        text: 'Sounds like a plan',
      ),
      TextMessage(
        id: '7',
        authorId: 'user1',
        text: 'Where should we meet?',
      ),
      TextMessage(
        id: '8',
        authorId: 'user1',
        text: 'What about Pokok?',
      ),
      TextMessage(
        id: '9',
        replyToMessageId: '5',
        authorId: 'user1',
        text: 'Hehe',
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

              // ── Sticky header ──

              Container(
                color: Colors.black.withValues(alpha: 0.04),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
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

                      Column(
                        children: [
                          Text('Tan Mei Mei', style: text16Bold.copyWith(color: AppGrey.lightMain), ), // bold
                          Text('online 23hrs ago', style: text14Regular.copyWith(color: AppGrey.light500), ), // grey, small
                        ],
                      ),

                      InkWell(
                        onTap: () {},
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
                            child: Icon(Icons.more_horiz,
                                color: Colors.black, size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      String? repliedText;
                      if (message.replyToMessageId != null) {
                        final repliedMessage = _chatController.messages
                            .where((m) => m.id == message.replyToMessageId)
                            .firstOrNull;
                        if (repliedMessage is TextMessage) {
                          repliedText = repliedMessage.text;
                        }
                      }

                      return Container(
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
                                  color: isSentByMe ? AppGrey.light200 : Color(0xFF4CAF93) ,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border(
                                    left: BorderSide(
                                      color: isSentByMe ? AppGrey.light300: AppGrey.light300,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  repliedText,
                                  style: text14Regular.copyWith(color: isSentByMe ? AppGrey.lightMain : Colors.white,),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Text(
                              message.text,
                              style: text14Regular.copyWith(color: isSentByMe ? Colors.white : AppGrey.lightMain,),
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
}