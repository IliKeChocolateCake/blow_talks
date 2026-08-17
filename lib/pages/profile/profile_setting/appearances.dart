import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:blow_talks/main.dart';
// ── How to trigger this bottom sheet ──────────────────────────────────────
//
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) => const AppearanceBottomSheet(),
//   );
//
// ─────────────────────────────────────────────────────────────────────────

class AppearanceBottomSheet extends StatefulWidget {
  final int initialIndex;
  const AppearanceBottomSheet({super.key, this.initialIndex = 0});

  @override
  State<AppearanceBottomSheet> createState() => _AppearanceBottomSheetState();
}

class _AppearanceBottomSheetState extends State<AppearanceBottomSheet> {
  // 0 = Light, 1 = Dark, 2 = System
  int _selected = 0;
  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppGrey.light100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // drag handle
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppGrey.light300,
              borderRadius: BorderRadius.circular(100),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric( vertical: 20),
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
                      color: AppFixed.lightGreyTransparent,
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: const Center(
                      child: Icon(Icons.close,
                          color: Colors.black, size: 24),
                    ),
                  ),
                ),
                Expanded(child: Center(

                  child: Text('Appearances', style: text16Bold.copyWith(color: AppGrey.lightMain),),

                ),),
                InkWell(
                  onTap: () {
                    // apply the selected theme globally
                    switch (_selected) {
                      case 0:
                        appThemeMode.value = ThemeMode.light;
                        break;
                      case 1:
                        appThemeMode.value = ThemeMode.dark;
                        break;
                      case 2:
                        appThemeMode.value = ThemeMode.system;
                        break;
                    }
                    Navigator.pop(context, _selected);
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
                      child: Icon(Icons.check,
                          color: Colors.white, size: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // theme options row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ThemeOption(
                label: 'Light',
                selected: _selected == 0,
                preview: const _LightPreview(),
                onTap: () => setState(() => _selected = 0),
              ),
              _ThemeOption(
                label: 'Dark',
                selected: _selected == 1,
                preview: const _DarkPreview(),
                onTap: () => setState(() => _selected = 1),
              ),
              _ThemeOption(
                label: 'System',
                selected: _selected == 2,
                preview: const _SystemPreview(),
                onTap: () => setState(() => _selected = 2),
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ── Single selectable theme option ───────────────────────────────────────

class _ThemeOption extends StatelessWidget {
  final String label;
  final bool selected;
  final Widget preview;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.label,
    required this.selected,
    required this.preview,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? brandColor : Colors.transparent,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: preview,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? AppGrey.lightMain : AppGrey.light500,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Theme preview illustrations ───────────────────────────────────────────

class _LightPreview extends StatelessWidget {
  const _LightPreview();

  @override
  Widget build(BuildContext context) {
    return _PhoneMockup(
      background: const Color(0xffF6F6F6),
      dotColor: const Color(0xffD9D8D8),
      barColors: const [Color(0xffD9D8D8), Color(0xffD9D8D8), Color(0xffD9D8D8)],
      cardColor: Colors.white,
      cardBarColors: const [Color(0xffD9D8D8), Color(0xffD9D8D8)],
    );
  }
}

class _DarkPreview extends StatelessWidget {
  const _DarkPreview();

  @override
  Widget build(BuildContext context) {
    return _PhoneMockup(
      background: const Color(0xff1F1F1F),
      dotColor: const Color(0xff706E6E),
      barColors: const [Color(0xff706E6E), Color(0xff706E6E), Color(0xff706E6E)],
      cardColor: const Color(0xff2F2E2E),
      cardBarColors: const [Color(0xff706E6E), Color(0xff706E6E)],
    );
  }
}

class _SystemPreview extends StatelessWidget {
  const _SystemPreview();

  @override
  Widget build(BuildContext context) {
    // Split half light / half dark
    return SizedBox(
      width: 90,
      height: 130,
      child: Row(
        children: [
          // left half — light
          Expanded(
            child: ClipRect(
              child: OverflowBox(
                alignment: Alignment.centerLeft,
                maxWidth: 180,
                child: const _LightPreview(),
              ),
            ),
          ),
          // right half — dark
          Expanded(
            child: ClipRect(
              child: OverflowBox(
                alignment: Alignment.centerRight,
                maxWidth: 180,
                child: const _DarkPreview(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Generic phone mockup widget ───────────────────────────────────────────

class _PhoneMockup extends StatelessWidget {
  final Color background;
  final Color dotColor;
  final List<Color> barColors;
  final Color cardColor;
  final List<Color> cardBarColors;

  const _PhoneMockup({
    required this.background,
    required this.dotColor,
    required this.barColors,
    required this.cardColor,
    required this.cardBarColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 130,
      color: background,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar dot
          CircleAvatar(radius: 8, backgroundColor: dotColor),
          const SizedBox(height: 6),

          // bar lines (simulating text rows)
          ...barColors.map((c) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )),

          const SizedBox(height: 6),

          // card block
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: cardBarColors
                    .map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    height: 5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: c,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}