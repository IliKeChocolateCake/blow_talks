import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/pages/chat/chat_main.dart';
import 'package:blow_talks/pages/home/creator/home_creator.dart';
import 'package:blow_talks/pages/home/home.dart';
import 'package:blow_talks/pages/notifications/notification.dart';
import 'package:blow_talks/pages/profile/profile.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {

  final int initialIndex;
  final String role;
  const Navigation({super.key, required this.role, required this.initialIndex});

  @override
  State<Navigation> createState() => NavigationPage();
}

class NavigationPage extends State<Navigation> {
  late int _selectedIndex = widget.initialIndex;

  late final List<Widget> _pages = [
    widget.role == 'creator' ? const HomeCreator() : const Home(),
    const ChatMain(),
    const NotificationsScreen(),
    const ProfileScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Row(
          children: [
            // ── Pill navbar ──
            Expanded(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _navItem('asset/navigation/community.png', 0),
                    _navItem('asset/navigation/chat.png', 1),
                    _navItem('asset/navigation/notification.png', 2),
                    _navItem('asset/navigation/profile.png', 3),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ── Search button — separate circle ──
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 4),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: _selectedIndex == 4
                      ? AppGrey.lightMenuItemBg
                      : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset('asset/navigation/search.png')
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _navItem(String image, int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? isDarkMode(context)?AppGrey.darkMenuItemBg:AppGrey.lightMenuItemBg
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(image)
      ),
    );
  }
}

// ── Placeholder screens ───────────────────────────────────────────────────────

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Expanded(child: ChatMain());
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Notifications());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Profile());
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Search'));
}