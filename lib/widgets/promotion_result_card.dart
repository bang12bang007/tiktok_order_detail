import 'package:flutter/material.dart';

import '../theme/app_font.dart';

class PromotionResultCard extends StatelessWidget {
  const PromotionResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);
    final Color containerBg = isDark ? const Color(0xFF252629) : const Color(0xFFF8F8F8);
    final Color dividerColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Row(
            children: [
              Text(
                'Kết quả quảng bá',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.info_outline, size: 14, color: subTextColor),
            ],
          ),
          const SizedBox(height: 14),

          // 1. Full-width light grey box container for "Người xem LIVE" -> "2.775"
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerBg,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Người xem LIVE',
                  style: TextStyle(fontSize: 14.6, color: subTextColor),
                ),
                const SizedBox(height: 6),
                Text(
                  '1.873',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 2. Flat layout for "Chi phí quảng cáo" -> "186,8$"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chi phí quảng cáo',
                style: TextStyle(fontSize: 14.5, color: subTextColor),
              ),
              const SizedBox(height: 6),
              Text(
                '120\$',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3. Refund warning notice box
          /*Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerBg,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 11.5,
            ),
            child: Text(
              'Số tiền còn lại sẽ được tự động hoàn lại vào số dư Quảng bá của bạn sau khi quảng cáo của bạn kết thúc. Bạn có thể sử dụng số tiền này cho quảng cáo tiếp theo hoặc rút số dư khỏi tài khoản của mình.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: textColor, // Deep TikTok black text
                height: 1.3,
              ),
            ),
          ),*/
         /* const SizedBox(height: 20),
          Divider(color: dividerColor, thickness: 1.0, height: 1.0),
          const SizedBox(height: 20),

          // Dữ liệu tương tác section
          Row(
            children: [
              Text(
                'Dữ liệu tương tác',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.info_outline, size: 14, color: subTextColor),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildInfoColumn(context, 'Những Follower mới', '7')),
              Expanded(child: _buildInfoColumn(context, 'Thích', '4280')),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildInfoColumn(context, 'Lượt bình luận', '61')),
              Expanded(child: _buildInfoColumn(context, 'Lượt chia sẻ', '10')),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: dividerColor, thickness: 1.0, height: 1.0),
          const SizedBox(height: 20),

          // Dữ liệu LIVE section
          Row(
            children: [
              Text(
                'Dữ liệu LIVE',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.info_outline, size: 14, color: subTextColor),
            ],
          ),
          const SizedBox(height: 16),

          // LIVE metrics row (Significantly increased as requested)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số lượt hiển thị của phiên \nLIVE',
                      style: TextStyle(fontSize: 14.55, color: subTextColor, fontFamily: AppFont.sans),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '6.962',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Thời gian xem trung bình',
                      style: TextStyle(fontSize: 14.55, color: subTextColor),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '  7.7 giây',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }

  Widget _buildInfoColumn(BuildContext context, String label, String value) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.5,
            color: subTextColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.3,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
