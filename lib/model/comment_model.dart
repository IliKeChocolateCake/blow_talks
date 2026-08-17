import 'package:blow_talks/const/constant.dart';
import 'package:flutter/material.dart';

// ── Badge data ──
class BadgeModel {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  const BadgeModel({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
  });
}

// ── Reply ──
class ReplyModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String text;
  final int likes;
  final String timeAgo;
  final BadgeModel? badge;// null = no badge
  final String mention;

  ReplyModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.text,
    required this.likes,
    required this.timeAgo,
    this.badge,
    required this.mention
  });
}

// ── Comment ──
class CommentModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String text;
  final int likes;
  final String timeAgo;
  final List<ReplyModel> replies;
  final BadgeModel? badge; // null = no badge

  CommentModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.text,
    required this.likes,
    required this.timeAgo,
    this.replies = const [],
    this.badge,
  });
}

final beginnerBadge = BadgeModel(
  label: 'BEGINNER',
  icon: Icons.diamond,
  backgroundColor: brandTransparentLight,
  iconColor: brandColor,
  textColor: brandColor,
  borderColor: brandColor,
);


final masterBadge =  BadgeModel(
    label: 'MASTER',
    icon: Icons.diamond,
    backgroundColor: AppOthers.lightPinkTransparent,
    iconColor: AppOthers.lightPinkMain,
    textColor: AppOthers.lightPinkMain,
    borderColor: AppOthers.lightPinkMain
);

final grandmasterBadge =  BadgeModel(
    label: 'GRANDMASTER',
    icon: Icons.diamond,
    backgroundColor: AppOthers.lightYellowTransparent,
    iconColor: AppOthers.lightYellowMain,
    textColor: AppOthers.lightYellowMain,
    borderColor: AppOthers.lightYellowMain
);

final List<CommentModel> dummyComments = [
  CommentModel(
    id: '1',
    userName: 'Zara Khan',
    userAvatar: 'asset/discussion/zara.png',
    text: '👍 Great points, Evelyn! It\'s crucial to address these biases to ensure AI benefits everyone, not just a select few.',
    likes: 4,
    timeAgo: '17 Apr',
    badge: beginnerBadge,
    replies: [
      ReplyModel(
        id: '1-1',
        userName: 'See Ying',
        userAvatar: 'asset/discussion/ying.png',
        text: 'Can’t agree more!',
        likes: 0,
        timeAgo: '18 Apr',
        badge:masterBadge,
        mention: '@Zara Khan '
      ),
      ReplyModel(
        id: '1-2',
        userName: 'Zara Khan',
        userAvatar: 'asset/discussion/zara.png',
        text: 'Happy to hear that🥳',
        likes: 0,
        timeAgo: '18 Apr',
        badge: beginnerBadge,
        mention: '@See Ying '
      ),
    ],
  ),
  CommentModel(
    id: '2',
    userName: 'Yong Yong',
    userAvatar: 'asset/discussion/yong.png',
    text: 'Cool! Thanks for sharing 🫡',
    likes: 0,
    timeAgo: '18 Apr',
    badge: grandmasterBadge,
  ),
];