import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AudienceInsightCard extends StatefulWidget {
  const AudienceInsightCard({super.key});

  @override
  State<AudienceInsightCard> createState() => _AudienceInsightCardState();
}

class _AudienceInsightCardState extends State<AudienceInsightCard> {
  String _activeTab = 'Giới tính';
  final List<String> _tabs = ['Giới tính', 'Tuổi', 'Mối quan tâm'];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);
    final Color dividerColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Thông tin chuyên sâu về đối tượng khán giả',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),

          // Horizontal Tab Bar (Segmented control)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _tabs.map((tab) => _buildTabItem(context, tab)).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Conditional display based on active tab
          if (_activeTab == 'Giới tính') ...[
            // Beautiful PieChart from fl_chart library
            Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 55, // Donut hole radius
                    startDegreeOffset: 270, // Start drawing from the top
                    sections: [
                      // Nữ: 24% (Darker Blue)
                      PieChartSectionData(
                        color: const Color(0xFF00A2D7),
                        value: 24,
                        title: '',
                        radius: 30,
                      ),
                      // Nam: 76% (Lighter Cyan)
                      PieChartSectionData(
                        color: const Color(0xFF97E2EF),
                        value: 76,
                        title: '', // Do not display titles inside chart segments
                        radius: 30, // Donut ring width
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Symmetric Legends & Percentages Row matching user screenshot values (76% Nam / 24% Nữ)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Nam (Male) Column
                Column(
                  children: [
                    Text(
                      '76%',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
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
                        Text(
                          'Nam',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: subTextColor,
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
                    Text(
                      '24%',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
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
                        Text(
                          'Nữ',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: subTextColor,
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
            _buildHorizontalProgressBarRow(context, '13-17', 0.34),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, '18-24', 0.20),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, '25-34', 0.17),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, '35-44', 0.14),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, '45-54', 0.05),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, '55+', 0.00),
          ] else if (_activeTab == 'Mối quan tâm') ...[
            // Interests vertical list
            const SizedBox(height: 12),
            _buildHorizontalProgressBarRow(context, 'Trò chơi', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, 'Tin tức và Giải trí', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, 'Thực phẩm và Đồ uống', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, 'Các ứng dụng', 0.06),
            const SizedBox(height: 16),
            _buildHorizontalProgressBarRow(context, 'Trang phục & Phụ kiện', 0.06),
            const SizedBox(height: 20),
            Divider(color: dividerColor, thickness: 1.0, height: 1.0),
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
                    children: [
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: subTextColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 14,
                        color: subTextColor,
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

  Widget _buildHorizontalProgressBarRow(BuildContext context, String label, double percentage) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color barBgColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3);
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
              style: TextStyle(
                fontSize: 14.0,
                color: textColor, // Black/White text
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '$displayPercentage%',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: textColor,
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
            color: barBgColor, // Light grey/dark background bar
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

  Widget _buildTabItem(BuildContext context, String tabName) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isActive = _activeTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTab = tabName;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          color: isActive
              ? (isDark ? const Color(0xFF1D1F24) : Colors.white)
              : (isDark ? const Color(0xFF252629) : const Color(0xFFF1F1F3)),
          borderRadius: BorderRadius.circular(4.0),
          border: isActive
              ? Border.all(color: isDark ? Colors.white : const Color(0xFF161823), width: 1.0)
              : null,
        ),
        padding: const EdgeInsets.all(6),
        child: Text(
          tabName,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive
                ? (isDark ? Colors.white : const Color(0xFF161823))
                : (isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B)),
          ),
        ),
      ),
    );
  }
}
