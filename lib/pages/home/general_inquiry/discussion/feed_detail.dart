import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:blow_talks/model/comment_model.dart';

class FeedDetail extends StatefulWidget {
  const FeedDetail({super.key});

  @override
  State<FeedDetail> createState() => FeedDetailPage();
}

class FeedDetailPage extends State<FeedDetail> {

  // ── State ──
  List<CommentModel> comments = dummyComments;

  // ── Toggle like on comment ──
  void _toggleCommentLike(int index) {
    setState(() {
      final c = comments[index];
      comments[index] = CommentModel(
        id: c.id,
        userName: c.userName,
        userAvatar: c.userAvatar,
        text: c.text,
        likes: c.likes + 1,
        timeAgo: c.timeAgo,
        replies: c.replies,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
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
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_upward,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                    hintText: 'Say Something',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle:
                    text14Regular.copyWith(color: AppGrey.light300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
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

              // ── Scrollable content ──
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  // ↑ bottom padding so content doesn't hide behind FAB
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Post header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('asset/chat/evelyn.png'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Evelyn Hayes',
                                        style: text14Medium.copyWith(
                                            color: AppGrey.lightMain)),
                                    const SizedBox(width: 8),
                                    _buildBadge2(
                                      'EXPERT',
                                      Icons.diamond,
                                      AppOthers.lightBlueTransparent,
                                      AppOthers.lightBlueMain,
                                      AppOthers.lightBlueMain,
                                      AppOthers.lightBlueMain,
                                    ),
                                    const SizedBox(width: 8),
                                    _buildBadge2(
                                      'ADMIN',
                                      Icons.brightness_1,
                                      AppGrey.light200,
                                      AppOthers.lightBlueMain,
                                      AppGrey.lightMain,
                                      AppGrey.light300,
                                    ),
                                    const Spacer(),
                                    Text('25 Mar',
                                        style: text12Regular.copyWith(
                                            color: AppGrey.light400)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'AI-related 🤖',
                                  style: text12Medium.copyWith(
                                      color: AppGrey.light500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Post content
                      Text(
                        'The Alignment Problem: Steering AI Towards Human Values 🚀',
                        style: text14Bold.copyWith(color: AppGrey.lightMain),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'In the realm of AI ethics, ensuring fairness stands as a critical challenge. Algorithmic bias, stemming from prejudiced data or flawed design, can perpetuate societal inequalities.\n',
                        style: text14Regular.copyWith(color: AppGrey.light600),
                      ),
                      Text(
                        'Detection methods involve statistical analysis, fairness metrics, and adversarial testing to unearth disparities.\n',
                        style: text14Regular.copyWith(color: AppGrey.light600),
                      ),
                      Text(
                        'Mitigation strategies encompass data re-balancing, algorithm modification, and fairness-aware training. By proactively addressing bias, we strive to create AI systems that uphold justice, equity, and inclusivity for all individuals, fostering a more equitable technological landscape.',
                        style: text14Regular.copyWith(color: AppGrey.light600),
                      ),

                      const SizedBox(height: 16),

                      Center(
                        child: Image.asset('asset/discussion/discussion.png'),
                      ),

                      const SizedBox(height: 16),

                      // Likes + comments
                      Row(
                        children: [
                          Icon(Icons.favorite,
                              size: 20, color: AppOthers.lightRedMain),
                          const SizedBox(width: 8),
                          Text('22',
                              style: text14Regular.copyWith(
                                  color: AppGrey.light600)),
                          const SizedBox(width: 8),
                          Icon(Icons.chat_bubble_outline,
                              size: 20, color: AppGrey.light500),
                          const SizedBox(width: 8),
                          Text('10',
                              style: text14Regular.copyWith(
                                  color: AppGrey.light600)),
                          const Spacer(),
                          Icon(Icons.more_horiz_outlined,
                              color: AppGrey.light500, size: 20),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' Comments (${dummyComments.length + dummyComments.fold(0, (sum, c) => sum + c.replies.length)})',
                          style: text14Bold.copyWith(color: AppGrey.lightMain),
                        ),
                      ),

                      const SizedBox(height: 16),




                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: comments.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // ── Parent comment ──
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage: AssetImage(comment.userAvatar),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(comment.userName,
                                                style: text14Medium.copyWith(
                                                    color: AppGrey.lightMain)),

                                            if (comment.badge != null) ...[
                                              const SizedBox(width: 8),
                                              _buildBadge(comment.badge!),
                                            ],

                                            const Spacer(),
                                            Text(comment.timeAgo,
                                                style: text10Regular.copyWith(
                                                    color: AppGrey.light400)),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(comment.text,
                                            style: text12Regular.copyWith(
                                                color: AppGrey.light600)),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => _toggleCommentLike(index),
                                              child: Icon(Icons.favorite_border,
                                                  size: 14, color: AppGrey.light400),
                                            ),
                                            const SizedBox(width: 4),
                                            Text('${comment.likes}',
                                                style: text10Regular.copyWith(
                                                    color: AppGrey.light400)),
                                            const SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text('Reply',
                                                  style: text10Medium.copyWith(
                                                      color: AppGrey.light400)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // ── Nested replies ──
                              if (comment.replies.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(left: 44),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: comment.replies.length,
                                    separatorBuilder: (_, _) =>
                                    const SizedBox(height: 12),
                                    itemBuilder: (context, replyIndex) {
                                      final reply = comment.replies[replyIndex];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundImage:
                                              AssetImage(reply.userAvatar),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(reply.userName,
                                                          style: text12Medium.copyWith(
                                                              color: AppGrey.lightMain)),

                                                      if (reply.badge != null) ...[
                                                        const SizedBox(width: 8),
                                                        _buildBadge(reply.badge!),
                                                      ],

                                                      const Spacer(),
                                                      Text(reply.timeAgo,
                                                          style: text10Regular.copyWith(
                                                              color: AppGrey.light400)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 2),

                                                  Wrap(

                                                    crossAxisAlignment: WrapCrossAlignment.center,

                                                    children: [

                                                      Text(reply.mention,
                                                          style: text12Regular.copyWith(
                                                              color: AppOthers.lightBlueMain)),
                                                      Text(reply.text,
                                                          style: text12Regular.copyWith(
                                                              color: AppGrey.light600)),
                                                    ],

                                                  ),

                                                  const SizedBox(height: 6),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.favorite_border,
                                                          size: 14,
                                                          color: AppGrey.light400),
                                                      const SizedBox(width: 4),
                                                      Text('${reply.likes}',
                                                          style: text10Regular.copyWith(
                                                              color: AppGrey.light400)),
                                                      const SizedBox(width: 16),
                                                      Text('Reply',
                                                          style: text10Medium.copyWith(
                                                              color: AppGrey.light400)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBadge(BadgeModel badge) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badge.backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: badge.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badge.icon, size: 12, color: badge.iconColor),
          const SizedBox(width: 4),
          Text(badge.label, style: text10Medium.copyWith(color: badge.textColor)),
        ],
      ),
    );
  }

  Widget _buildBadge2(
      String label,
      IconData icon,
      Color backgroundColor,
      Color iconColor,
      Color textColor,
      Color borderColor,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: iconColor),
          const SizedBox(width: 4),
          Text(label, style: text10Medium.copyWith(color: textColor)),
        ],
      ),
    );
  }
}