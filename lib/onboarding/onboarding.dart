import 'package:blow_talks/onboarding/login.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/const/constant.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => OnboardingPage();
}

class OnboardingPage extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _activePage = page;
    });
  }

  void _onNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light50,
      body: SafeArea(
        child: Column(
          children: [
            // Image area — top large space
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index],
              ),
            ),

            // Text + dots + button pinned to bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Title
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      _pageTitle(_activePage),
                      key: ValueKey(_activePage),
                      style: text24Bold,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      _pageSubtitle(_activePage),
                      key: ValueKey('sub$_activePage'),
                      style: text16Regular.copyWith(color: AppGrey.light500),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Dots indicator
                  DotsIndicator(
                    dotsCount: _pages.length,
                    position: _activePage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size(8, 8),
                      activeSize: const Size(8, 8),
                      color: Colors.grey.shade300,
                      activeColor: Colors.black87,
                      spacing: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandColor.shade500, // brandColor 500
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                         'Get Started',
                        style: text14Regular,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _pageTitle(int page) {
    switch (page) {
      case 0: return 'Welcome!';
      case 1: return 'Learn Together';
      case 2: return 'Create Your Space';
      default: return '';
    }
  }

  String _pageSubtitle(int page) {
    switch (page) {
      case 0: return 'A space for real connection and meaningful growth.';
      case 1: return 'Join discussion, share insights, and grow alongside others who care.';
      case 2: return 'Host your own community, run events, or launch your next big idea.';
      default: return '';
    }
  }
}

// ── Pages now only contain the image ──────────────────────────────────────────

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('asset/onboarding/learn.png'),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('asset/onboarding/together.png'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('asset/onboarding/chat.png'),
    );
  }
}