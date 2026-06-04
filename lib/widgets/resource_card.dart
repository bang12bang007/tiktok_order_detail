import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
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
            'Tài nguyên',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),

          // Resource List Items
          _buildResourceItem(
            context,
            svgIcon: 'assets/svg/ic_plus.svg',
            title: 'Thêm lối tắt',
            subtitle: 'Dễ dàng truy cập tính năng Quảng bá từ màn hình chính.',
            onTap: () {
              // Action to add shortcut
            },
          ),
          const SizedBox(height: 12),
          Divider(
            color: dividerColor,
            thickness: 1.0,
            height: 1.0,
          ),
          const SizedBox(height: 12),
          _buildResourceItem(
            context,
            svgIcon: 'assets/svg/ic_play.svg',
            title: 'Tìm hiểu thêm các mẹo',
            subtitle: 'Theo dõi tài khoản chính thức của tính năng Quảng bá để tìm hiểu về các mẹo và tính năng mới nhất.',
            onTap: () {
              // Action to learn tips
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResourceItem(
    BuildContext context, {
    required String svgIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color titleColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subtitleColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);
    final ColorFilter iconColor = isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : const ColorFilter.mode(const Color(0xFF161823), BlendMode.srcIn);
    final Color chevronColor = isDark ? const Color(0xFF8E8E93) : Colors.black;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Custom Icon with a little padding
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: SvgPicture.asset(
                svgIcon,
               width: 20,
                colorFilter: iconColor,

              ),
            ),
            const SizedBox(width: 12),

            // Content Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: subtitleColor,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Right Chevron Arrow
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: chevronColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
