import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/transaction/all_transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => TransactionsPage();
}

class TransactionsPage extends State<Transactions> {
  String _selectedMonth = 'Oct 2025';

  final List<String> _months = [
    'Oct 2025', 'Sep 2025', 'Aug 2025', 'Jul 2025',
  ];

  final List<Map<String, dynamic>> _categories = [
    {
      'label': 'Membership',
      'icon': 'asset/leaderboard/member.png',
      'amount': 521.61,
      'percent': 42.61,
      'transactions': 14,
      'color': brandColor,
    },
    {
      'label': 'Channel',
      'icon': 'asset/leaderboard/hashtag.png',
      'amount': 330.64,
      'percent': 27.05,
      'transactions': 22,
      'color': brandColor,
    },
    {
      'label': 'Course',
      'icon': 'asset/leaderboard/book.png',
      'amount': 370.35,
      'percent': 30.34,
      'transactions': 18,
      'color': brandColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // ── Header ──
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
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
                        child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Transactions', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),

              const SizedBox(height: 20),

              // ── Month Dropdown ──
              InkWell(
                onTap: () async {
                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(0, 180, 20, 0),
                    items: _months.map((m) => PopupMenuItem(
                      value: m,
                      child: Text(m, style: text14Regular),
                    )).toList(),
                  );
                  if (selected != null) setState(() => _selectedMonth = selected);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppGrey.light200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_selectedMonth, style: text14Regular.copyWith(color: AppGrey.lightMain)),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 16, color: AppGrey.light400),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Donut Chart Card ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Donut chart
                          CustomPaint(
                            size: const Size(180, 180),
                            painter: _DonutPainter(
                              values: [42.61, 27.05, 30.34],
                              colors: [
                                brandColor,
                                brandColor.shade300,
                                brandColor.shade100,
                              ],
                            ),
                          ),

                          // Center text
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('\$ 1,223', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                              Text('Total Earning', style: text12Regular.copyWith(color: AppGrey.light400)),
                            ],
                          ),

                          // Labels (add indicator later)
                          Positioned(
                            top: 0,
                            left: 0,
                            child: _chartLabel('\$370.35', 'Course'),
                          ),
                          Positioned(
                            top: -4,
                            right: 0,
                            child: _chartLabel('\$521.61', 'Membership'),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: _chartLabel('\$330.64', 'Channel'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Category List ──
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: _categories.asMap().entries.map((entry) {
                    final i = entry.key;
                    final cat = entry.value;
                    return Column(
                      children: [
                        _categoryTile(cat),
                        if (i < _categories.length - 1)
                          Divider(color: AppGrey.light200, thickness: 1, height: 0),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chartLabel(String amount, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(amount, style: text14Bold.copyWith(color: AppGrey.lightMain)),
        Text(label, style: text12Regular.copyWith(color: AppGrey.light400)),
      ],
    );
  }

  Widget _categoryTile(Map<String, dynamic> cat) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(

        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AllTransaction()),
          );
        },
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppGrey.light100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(cat['icon'], height: 48, width: 48,),
            ),

            const SizedBox(width: 12),

            // Label + progress
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat['label'], style: text14Bold.copyWith(color: AppGrey.lightMain)),
                  const SizedBox(height: 2),
                  Text(
                    '${cat['percent']}% (${cat['transactions']} Transactions)',
                    style: text12Regular.copyWith(color: AppGrey.light400),
                  ),
                  const SizedBox(height: 6),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: cat['percent'] / 100,
                      minHeight: 4,
                      backgroundColor: AppGrey.light200,
                      valueColor: AlwaysStoppedAnimation<Color>(cat['color']),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),
            Icon(Icons.chevron_right, size: 18, color: AppGrey.light300),
          ],
        ),

      ),
    );
  }
}

// ── Donut Chart Painter ──
class _DonutPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;

  _DonutPainter({required this.values, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final total = values.fold(0.0, (a, b) => a + b);
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    double startAngle = -90 * (3.14159 / 180);
    final strokeWidth = 28.0;

    for (int i = 0; i < values.length; i++) {
      final sweepAngle = (values[i] / total) * 2 * 3.14159;
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        rect.deflate(strokeWidth / 2),
        startAngle,
        sweepAngle - 0.05,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}