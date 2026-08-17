import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => CreateEventPage();
}

class CreateEventPage extends State<CreateEvent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  DateTime _startDate = DateTime(2025, 11, 5, 15, 0);
  DateTime _endDate = DateTime(2025, 11, 5, 16, 0);
  String _repeats = 'None';
  String _mode = 'Virtual Session';

  @override
  void dispose() {
    _nameController.dispose();
    _linkController.dispose();
    _descController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime dt) =>
      '${dt.day} ${_monthName(dt.month)} ${dt.year}';

  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : dt.hour == 0 ? 12 : dt.hour;
    final min = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$min $period';
  }

  String _monthName(int month) => const [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ][month];

  Future<void> _pickDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = DateTime(picked.year, picked.month, picked.day,
              _startDate.hour, _startDate.minute);
        } else {
          _endDate = DateTime(picked.year, picked.month, picked.day,
              _endDate.hour, _endDate.minute);
        }
      });
    }
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(isStart ? _startDate : _endDate),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = DateTime(_startDate.year, _startDate.month,
              _startDate.day, picked.hour, picked.minute);
        } else {
          _endDate = DateTime(_endDate.year, _endDate.month, _endDate.day,
              picked.hour, picked.minute);
        }
      });
    }
  }

  Widget _pill(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppGrey.light100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: text14Regular.copyWith(color: AppGrey.lightMain)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light50,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ── Header ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                        child: Icon(Icons.close, color: Colors.black, size: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Create Event', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Image Picker ──
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: AppGrey.light100,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(Icons.camera_alt_outlined, color: AppGrey.light400, size: 20),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Event Name ──
                    TextField(
                      controller: _nameController,
                      style: text14Regular.copyWith(color: AppGrey.lightMain),
                      decoration: InputDecoration(
                        hintText: 'Event Name',
                        hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: brandColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Date/Time Card ──
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [

                          // Starts
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Text('Starts', style: text14Bold.copyWith(color: AppGrey.lightMain)),
                                const Spacer(),
                                _pill(_formatDate(_startDate), () => _pickDate(true)),
                                const SizedBox(width: 8),
                                _pill(_formatTime(_startDate), () => _pickTime(true)),
                              ],
                            ),
                          ),

                          Divider(color: AppGrey.light200, thickness: 1, height: 0),

                          // Ends
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Text('Ends', style: text14Bold.copyWith(color: AppGrey.lightMain)),
                                const Spacer(),
                                _pill(_formatDate(_endDate), () => _pickDate(false)),
                                const SizedBox(width: 8),
                                _pill(_formatTime(_endDate), () => _pickTime(false)),
                              ],
                            ),
                          ),

                          Divider(color: AppGrey.light200, thickness: 1, height: 0),

                          // Repeats
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Text('Repeats', style: text14Bold.copyWith(color: AppGrey.lightMain)),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await showMenu<String>(
                                      context: context,
                                      position: RelativeRect.fromLTRB(200, 400, 20, 0),
                                      items: ['None', 'Daily', 'Weekly', 'Monthly']
                                          .map((e) => PopupMenuItem(value: e, child: Text(e, style: text14Regular)))
                                          .toList(),
                                    );
                                    if (result != null) setState(() => _repeats = result);
                                  },
                                  child: Row(
                                    children: [
                                      Text(_repeats, style: text14Regular.copyWith(color: AppGrey.light400)),
                                      const SizedBox(width: 4),
                                      Icon(Icons.unfold_more, size: 16, color: AppGrey.light300),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Once this event is set to repeat, it will turn into an event series. Each repeat will be treated as separate session in the same series.',
                      style: text12Regular.copyWith(color: AppGrey.light400),
                    ),

                    const SizedBox(height: 12),

                    // ── Mode Card ──
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Text('Mode', style: text14Bold.copyWith(color: AppGrey.lightMain)),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                final result = await showMenu<String>(
                                  context: context,
                                  position: RelativeRect.fromLTRB(200, 500, 20, 0),
                                  items: ['Virtual Session', 'In Person']
                                      .map((e) => PopupMenuItem(value: e, child: Text(e, style: text14Regular)))
                                      .toList(),
                                );
                                if (result != null) setState(() => _mode = result);
                              },
                              child: Row(
                                children: [
                                  Text(_mode, style: text14Regular.copyWith(color: AppGrey.light400)),
                                  const SizedBox(width: 4),
                                  Icon(Icons.unfold_more, size: 16, color: AppGrey.light300),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Link ──
                    TextField(
                      controller: _linkController,
                      style: text14Regular.copyWith(color: AppGrey.lightMain),
                      decoration: InputDecoration(
                        hintText: 'Link',
                        hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: brandColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Description ──
                    TextField(
                      controller: _descController,
                      maxLines: 5,
                      minLines: 4,
                      style: text14Regular.copyWith(color: AppGrey.lightMain),
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: brandColor),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}