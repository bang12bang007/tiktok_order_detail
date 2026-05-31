import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok/theme/app_font.dart';

class OrderStatusCard extends StatefulWidget {
  const OrderStatusCard({super.key});

  @override
  State<OrderStatusCard> createState() => _OrderStatusCardState();
}

class _OrderStatusCardState extends State<OrderStatusCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);
    final Color descriptionColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF5E6064);
    final Color dividerColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3);
    
    final String isImage = '';
    final bool isColumn = true; // chỉnh thành false nếu e muốn hiển thị ngang
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đã đóng',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: textColor, // TikTok dark black text
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Lệnh Quảng bá của bạn thu được 2.854 người xem LIVE. Nội dung của bạn vẫn có thể thu được lưu lượng truy cập tự nhiên ngay cả sau khi lệnh Quảng bá kết thúc.',
            style: TextStyle(
              fontSize: 15.8,
              fontFamily: AppFont.display,
              color: descriptionColor, // Darker, highly readable grey
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: dividerColor, thickness: 1.0, height: 1.0),
          const SizedBox(height: 16),

          // Video section row (Thumbnail on the left, multi-line details on the right)
          isColumn == true ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                  isImage == '' ? 'assets/images/avt_chamhoi.jpg' : isImage,
                  width: 48,
                  height: 68,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lets Go LIVE!',
                    style: TextStyle(
                      fontSize: 15.4,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    'LIVE của Hạ Vy Nè',
                    style: TextStyle(
                      fontSize: 15.4,
                      fontFamily: AppFont.sans,
                      color: subTextColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Tăng số người xem LIVE',
                    style: TextStyle(
                      fontSize: 15.4,
                      fontFamily: AppFont.sans,
                      color: subTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ) : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lets Go LIVE!',
                    style: TextStyle(
                      fontSize: 15.4,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'LIVE của Hạ Vy Nè',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.sans,
                      color: subTextColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    isImage == ''
                        ? 'assets/images/cicrle_ava.jpg'
                        : isImage,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          // Expandable rows (All campaign details are hidden initially and revealed upon tapping "Xem thêm")
          if (_isExpanded) ...[
            const SizedBox(height: 16),

            // Khán giả section (with chevron and wrapping text)
            InkWell(
              onTap: () {
                // Action when tapping on audience
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Khán giả',
                    style: TextStyle(
                      fontSize: 16,
                      color: subTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      'Giới tính: Nam; Tuổi: 18-24, 25-34, 35-44, 45-54; Vị trí: Việt Nam; Sở thích: Đời sống;',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: AppFont.sans,
                        fontSize: 15.8,
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: subTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            _buildInfoRow('Thời gian đặt hàng', '30 tháng năm 2026 03:22'),
            const SizedBox(height: 15),
            _buildInfoRow('Tổng thời lượng', '0.5giờ / 0.5giờ'),
            const SizedBox(height: 15),
            _buildRequestIDRow('ID Yêu cầu', '1976200362748037'),
            const SizedBox(height: 15),
            _buildInfoRow('Tổng ngân sách', '200\$'),
          ],

          const SizedBox(height: 12),
          Divider(color: dividerColor, thickness: 1.0, height: 1.0),
          const SizedBox(height: 8),

          // Xem thêm button
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isExpanded ? 'Ẩn bớt' : 'Xem thêm',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: subTextColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 20,
                      color: subTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestIDRow(String label, String value) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.5,
            color: subTextColor,
          ),
        ),
        const SizedBox(width: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 15.5,
                color: textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: value));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã sao chép ID Yêu cầu: $value'),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFF161823),
                  ),
                );
              },
              child: Icon(
                Icons.copy,
                size: 14,
                color: isDark ? const Color(0xFF8E8E93) : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161823);
    final Color subTextColor = isDark ? const Color(0xFF8E8E93) : const Color(0xFF86878B);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.4,
            color: subTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15.5,
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
