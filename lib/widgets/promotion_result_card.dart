import 'package:flutter/material.dart';

class PromotionResultCard extends StatelessWidget {
  const PromotionResultCard({super.key});

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
          // Header section
          Row(
            children: const [
              Text(
                'Kết quả quảng bá',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF161823),
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 14,
                color: Color(0xFF86878B),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 1. Full-width light grey box container for "Người xem LIVE" -> "2.775"
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Người xem LIVE',
                  style: TextStyle(
                    fontSize: 13.8,
                    color: Color(0xFF86878B),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '2.854',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF161823),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 2. Flat layout for "Chi phí quảng cáo" -> "186,8$"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Chi phí quảng cáo',
                style: TextStyle(
                  fontSize: 13.8,
                  color: Color(0xFF86878B),
                ),
              ),
              SizedBox(height: 6),
              Text(
                '200\$',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF161823),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3. Refund warning notice box
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            child: const Text(
              'Số tiền còn lại sẽ được tự động hoàn lại vào số dư Quảng bá của bạn sau khi quảng cáo của bạn kết thúc. Bạn có thể sử dụng số tiền này cho quảng cáo tiếp theo hoặc rút số dư khỏi tài khoản của mình.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87, // Very readable and clear dark grey
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFFF1F1F3),
            thickness: 1.0,
            height: 1.0,
          ),
          const SizedBox(height: 20),

          // Dữ liệu tương tác section
          Row(
            children: const [
              Text(
                'Dữ liệu tương tác',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF161823),
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 14,
                color: Color(0xFF86878B),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoColumn('Những Follower mới', '34'),
              ),
              Expanded(
                child: _buildInfoColumn('Thích', '5091'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoColumn('Lượt bình luận', '47'),
              ),
              Expanded(
                child: _buildInfoColumn('Lượt chia sẻ', '31'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFFF1F1F3),
            thickness: 1.0,
            height: 1.0,
          ),
          const SizedBox(height: 20),

          // Dữ liệu LIVE section
          Row(
            children: const [
              Text(
                'Dữ liệu LIVE',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF161823),
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 14,
                color: Color(0xFF86878B),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // LIVE metrics row (Significantly increased as requested)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoColumn('Số lượt hiển thị của phiên LIVE', '10.631'),
              ),
              Expanded(
                child: _buildInfoColumn('  Thời gian xem trung bình', ' 3,8 giây'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14.1,
            color: Color(0xFF86878B),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF161823),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricBox(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF86878B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF161823),
            ),
          ),
        ],
      ),
    );
  }
}
