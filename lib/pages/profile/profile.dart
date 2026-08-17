import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/member/feed_type/post.dart';
import 'package:blow_talks/pages/profile/follower_following.dart';
import 'package:blow_talks/pages/profile/profile_courses.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  const Profile ({super.key});
  @override
  State<Profile> createState() => MemberFeedPage();
}

class MemberFeedPage extends State<Profile> {
  static const double avatarRadius = 40;
  static const double bannerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
        body: SafeArea(child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // Banner + avatar, fully custom — no FlexibleSpaceBar, no
              // expandedHeight/toolbarHeight guesswork. We control every
              // pixel of this header ourselves.
              SliverPersistentHeader(
                pinned: true,
                delegate: _BannerAvatarDelegate(
                  bannerHeight: bannerHeight,
                  avatarRadius: avatarRadius,
                  bodyBackground:  isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                  onBack: () => Navigator.pop(context),
                  onMore: () {},
                  image: '',
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Text(
                        'Sofia Martinez',
                        style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),
                      ),
                      Text(
                        '@sofia0912',
                        style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500: AppGrey.light500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hello! I\'m Sofia, an adventurous spirit who dives into life with excitement. ',
                        style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark600: AppGrey.light600),
                      ),
                      const SizedBox(height: 12),

                      // badges
                      Row(
                        children: [
                          // offline badge
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode(context)?AppGrey.darkInputBg: AppGrey.lightInputBg,
                              borderRadius: BorderRadius.circular(100),
                              border: BoxBorder.all(color: AppGrey.light400),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.brightness_1, size: 6, color: isDarkMode(context)?AppAlert.darkSuccess500: AppAlert.lightSuccess500),
                                const SizedBox(width: 4),
                                Text('Online', style: text10Medium.copyWith(color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // location badge
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode(context)? AppGrey.darkInputBg:AppGrey.lightInputBg,
                              borderRadius: BorderRadius.circular(100),
                              border: BoxBorder.all(color: isDarkMode(context)?AppGrey.dark400: AppGrey.light400),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.location_on, size: 6, color:isDarkMode(context)?AppGrey.dark300: AppGrey.light300),
                                const SizedBox(width: 4),
                                Text('AUSTIN, TX', style: text10Medium.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // followers, contributions etc
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // followers

                            GestureDetector(

                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const FollowerFollowing( finalIndex: 0,)),
                                );

                              },

                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('23', style: text16Bold.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                                  Text('Followers', style: text10Regular.copyWith(color:isDarkMode(context)?AppGrey.dark400: AppGrey.light400)),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12),
                            // following

                            GestureDetector(

                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const FollowerFollowing( finalIndex: 1,)),
                                );
                              },

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('155', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                                  Text('Following', style: text10Regular.copyWith(color: isDarkMode(context)? AppGrey.dark400: AppGrey.light400)),
                                ],
                              ),

                            ),

                            const SizedBox(width: 12),
                            // contributions
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('34', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),
                                Text('Contributions', style: text10Regular.copyWith(color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400)),
                              ],
                            ),
                            const Spacer(),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(88, 32),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                side: BorderSide(color:isDarkMode(context)?AppGrey.dark300: AppGrey.light300, width: 1), // 👈
                                elevation: 0,
                              ),
                              child: Text('Edit Profile', style: text14Regular.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Sticky TabBar — pins below the profile info once it scrolls up
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyTabBarDelegate(
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    unselectedLabelStyle: text14Regular,
                    labelStyle: text14Medium,
                    labelColor: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain,
                    unselectedLabelColor: isDarkMode(context)?AppGrey.dark500: AppGrey.light500,
                    indicatorColor: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain,

                    tabs: const [
                      Tab(text: 'Posts'),
                      Tab(text: 'Comments'),
                      Tab(text: 'Ratings'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: const [
              Post(),
              Center(child: Text('Feature coming soon')),
              Center(child: Text('Feature coming soon')),
            ],
          ),
        ),),
      ),
    );
  }
}

/// Custom SliverPersistentHeader that draws the banner photo + avatar
/// together, with every pixel under our explicit control.
///
/// maxExtent  = bannerHeight + avatarRadius   (full expanded state: photo + the
///              strip the avatar's bottom half sits on)
/// minExtent  = avatarRadius                  (collapsed state: just enough
///              room for the back/more buttons row)
///
/// As the user scrolls, `shrinkOffset` goes from 0 (fully expanded) to
/// (maxExtent - minExtent) (fully collapsed). We use it to fade the
/// photo+avatar out so the header doesn't look broken mid-collapse, while
/// the back/more buttons stay put since they're pinned via Positioned.
class _BannerAvatarDelegate extends SliverPersistentHeaderDelegate {
  final double bannerHeight;
  final double avatarRadius;
  final Color bodyBackground;
  final VoidCallback onBack;
  final VoidCallback onMore;
  final String? image;

  _BannerAvatarDelegate({
    required this.bannerHeight,
    required this.avatarRadius,
    required this.bodyBackground,
    required this.onBack,
    required this.onMore,
    required this.image,
  });

  @override
  double get maxExtent => bannerHeight + avatarRadius;

  @override
  double get minExtent => avatarRadius;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double collapseRange = maxExtent - minExtent;
    final double expandFraction = collapseRange == 0
        ? 0
        : (1 - (shrinkOffset / collapseRange)).clamp(0.0, 1.0);

    return SizedBox(
      height: maxExtent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: bannerHeight,
            child: Opacity(
              opacity: expandFraction,
              child: Image.asset(
                'asset/banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   top: bannerHeight,
          //   left: 0,
          //   right: 0,
          //   height: avatarRadius,
          //   child: Container(color: bodyBackground),
          // ),
          Positioned(
            top: bannerHeight - avatarRadius,
            left: 20,
            child: Opacity(
              opacity: expandFraction,
              child: Container(
                width: avatarRadius * 2,
                height: avatarRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child:  ClipOval(
                  child: image != null
                      ? Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.person, color: brandColor, size: avatarRadius),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 80,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileCourses()),
                );
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.26),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(Icons.tv, color: Colors.white, size: 24),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileSetting()),
                );
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.26),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(Icons.settings_outlined, color: Colors.white, size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _BannerAvatarDelegate oldDelegate) {
    return oldDelegate.bannerHeight != bannerHeight ||
        oldDelegate.avatarRadius != avatarRadius ||
        oldDelegate.bodyBackground != bodyBackground ||
        oldDelegate.image != image;

  }
}

/// Wraps a TabBar so it can be used as a SliverPersistentHeader.
/// This is what makes the TabBar "stick" below the profile info on scroll.
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: isDarkMode(context)?AppGrey.dark50: AppGrey.light50,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}