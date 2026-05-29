import 'dart:math';
import 'package:flutter/material.dart';

class AudienceInsightCard extends StatefulWidget {
  const AudienceInsightCard({super.key});

  @override
  State<AudienceInsightCard> createState() => _AudienceInsightCardState();
}

class _AudienceInsightCardState extends State<AudienceInsightCard>
    with SingleTickerProviderStateMixin {
  String _activeTab = 'Giới tính';
  final List<String> _tabs = ['Giới tính', 'Tuổi', 'Mối quan tâm'];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Smooth 1.2s animation
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic, // Elegant ease-out motion curve
      ),
    );
    // Start animation on initial load
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Thông tin chuyên sâu về đối tượng khán giả',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF161823),
            ),
          ),
          const SizedBox(height: 16),

          // Horizontal Tab Bar (Segmented control)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _tabs.map((tab) => _buildTabItem(tab)).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Conditional display based on active tab
          if (_activeTab == 'Giới tính') ...[
            // Donut Chart Container with smooth AnimatedBuilder circular sweep animation
            Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: DonutChartPainter(
                        malePercentage: 1.0, // 100% Nam
                        femalePercentage: 0.0, // 0% Nữ
                        animationValue: _animation.value, // Dynamic animation factor
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Symmetric Legends & Percentages Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Nam (Male) Column
                Column(
                  children: [
                    const Text(
                      '100%',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF161823),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFF97E2EF), // Lighter Cyan
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Nam',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF86878B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Nữ (Female) Column
                Column(
                  children: [
                    const Text(
                      '0%',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF161823),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00A2D7), // Darker Blue
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Nữ',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF86878B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ] else if (_activeTab == 'Tuổi') ...[
            // Age vertical horizontal bars list
            const SizedBox(height: 12),
            _buildHorizontalProgressBarRow('13-17', 0.34),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('18-24', 0.20),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('25-34', 0.17),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('35-44', 0.14),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('45-54', 0.05),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('55+', 0.00),
          ] else if (_activeTab == 'Mối quan tâm') ...[
            // Interests vertical list
            const SizedBox(height: 12),
            _buildHorizontalProgressBarRow('Trò chơi', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('Tin tức và Giải trí', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('Thực phẩm và Đồ uống', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('Các ứng dụng', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow('Trang phục & Phụ kiện', 0.06),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFF1F1F3), thickness: 1.0, height: 1.0),
            const SizedBox(height: 12),
            // Center "Xem thêm ⋁" button
            Center(
              child: InkWell(
                onTap: () {
                  // Xem thêm action
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF86878B),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 14,
                        color: Color(0xFF86878B),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHorizontalProgressBarRow(String label, double percentage) {
    final int displayPercentage = (percentage * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF161823), // Black text
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '$displayPercentage%',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF161823),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Horizontal bar
        Container(
          width: double.infinity,
          height: 8.0,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F3), // Light grey background bar
            borderRadius: BorderRadius.circular(4.0),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: percentage > 0.0 ? percentage : 0.001, // Minimal width factor for zero percentage
            child: Container(
              height: 8.0,
              decoration: BoxDecoration(
                color: percentage > 0.0 ? const Color(0xFF00A2D7) : Colors.transparent, // Blue color active bar
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(String tabName) {
    final bool isActive = _activeTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTab = tabName;
          if (_activeTab == 'Giới tính') {
            // Reset and trigger circle draw animation whenever "Giới tính" tab is opened
            _animationController.reset();
            _animationController.forward();
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : const Color(0xFFF1F1F3),
          borderRadius: BorderRadius.circular(4.0),
          border: isActive
              ? Border.all(color: const Color(0xFF161823), width: 1.0)
              : null,
        ),
        padding: const EdgeInsets.all(6),
        child: Text(
          tabName,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? const Color(0xFF161823) : const Color(0xFF86878B),
          ),
        ),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final double malePercentage;
  final double femalePercentage;
  final double animationValue; // Animation factor from 0.0 to 1.0

  DonutChartPainter({
    required this.malePercentage,
    required this.femalePercentage,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final strokeWidth = radius * 0.35; // Precise donut ring width

    final paintMale = Paint()
      ..color = const Color(0xFF97E2EF) // Light Cyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final paintFemale = Paint()
      ..color = const Color(0xFF00A2D7) // Darker Blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    // Apply animation factor to sweep angles
    final double femaleSweep = 2 * pi * femalePercentage * animationValue;
    final double maleSweep = 2 * pi * malePercentage * animationValue;

    if (femalePercentage > 0.0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        -pi / 2,
        femaleSweep,
        false,
        paintFemale,
      );
    }

    if (malePercentage > 0.0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        -pi / 2 + (2 * pi * femalePercentage * animationValue), // Synchronized start angle
        maleSweep,
        false,
        paintMale,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.malePercentage != malePercentage ||
        oldDelegate.femalePercentage != femalePercentage ||
        oldDelegate.animationValue != animationValue;
  }
}
