import 'package:flutter/material.dart';

class AdManagerIntegrationCard extends StatelessWidget {
  const AdManagerIntegrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color descriptionColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF5E6064);

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
          // Bold Title
          Text(
            'Tích hợp với Trình quản lý Quảng cáo',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle / Description
          Text(
            'Mở khóa các chức năng nhắm mục tiêu mở rộng và tiết kiệm thời gian chỉ bằng một lần đăng nhập.',
            style: TextStyle(
              fontSize: 14.0,
              color: descriptionColor, // Crisp, readable grey color
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),

          // Interactive 'Bắt đầu >' Link/Button
          InkWell(
            onTap: () {
              // Action to start integration
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Bắt đầu',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFE2C55), // Brand primary pink/red
                  ),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 11,
                  color: Color(0xFFFE2C55),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
