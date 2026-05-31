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
    final String isImage = ''; // bên phải em add ảnh vào link này vào cái này nếu không em để '' kiểu này thì avt tự động set default
    final bool isRight =
        true; // chỉnh thành false khi avatar nằm bên phải true thì ngược lại
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Đã đóng',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF161823), // TikTok dark black text
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Lệnh Quảng bá của bạn thu được 2.873 người xem LIVE. Nội dung của bạn vẫn có thể thu được lưu lượng truy cập tự nhiên ngay cả sau khi lệnh Quảng bá kết thúc.',
            style: TextStyle(
              fontSize: 15.9,
              fontFamily: AppFont.display,
              color: Color(0xFF5E6064), // Darker, highly readable grey
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFF1F1F3), thickness: 1.0, height: 1.0),
          const SizedBox(height: 16),

          // Video section row (Thumbnail on the left, multi-line details on the right)
          isRight == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(
                        isImage == ''
                            ? 'assets/images/avt_chamhoi.jpg' // avt bên trái
                            : isImage,
                        width: 48,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Lets Go LIVE!',
                          style: TextStyle(
                            fontSize: 15.4,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF161823),
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'LIVE của Hạ Vy Nè',
                          style: TextStyle(
                            fontSize: 15.4,
                            fontFamily: AppFont.sans,
                            color: Color(0xFF86878B),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Tăng số người xem LIVE',
                          style: TextStyle(
                            fontSize: 15.4,
                            fontFamily: AppFont.sans,
                            color: Color(0xFF86878B),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Lets Go LIVE!',
                          style: TextStyle(
                            fontSize: 15.4,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF161823),
                          ),
                        ),
                        Text(
                          'LIVE của Hạ Vy Nè', //bên phải
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.sans,
                            color: Color(0xFF86878B),
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(
                          isImage == ''
                              ? 'assets/images/cicrle_ava.jpg' //bên phải
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
                  const Text(
                    'Khán giả',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF86878B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    child: Text(
                      'Giới tính: Nam; Tuổi: 18-24, 25-34, 35-44, 45-54; Vị trí: Việt Nam; Sở thích: Đời sống;',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: AppFont.sans,
                        fontSize: 15.8,
                        color: Color(0xFF161823),
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xFF86878B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            _buildInfoRow('Thời gian đặt hàng', '1 tháng sáu 2026 04:15'),
            const SizedBox(height: 15),
            _buildInfoRow('Tổng thời lượng', '0.5giờ/0.5giờ'),
            const SizedBox(height: 15),
            _buildRequestIDRow('ID Yêu cầu', '1699671135054720'),
            const SizedBox(height: 15),
            _buildInfoRow('Tổng ngân sách', '200\$'),
          ],

          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF1F1F3), thickness: 1.0, height: 1.0),
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
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF86878B),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 20,
                      color: const Color(0xFF86878B),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15.5, color: Color(0xFF86878B)),
        ),
        const SizedBox(width: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 15.5,
                color: Color(0xFF161823),
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
              child: const Icon(Icons.copy, size: 14, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.4,
            color: Color(0xFF86878B),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 15.5,
              color: Color(0xFF161823),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
