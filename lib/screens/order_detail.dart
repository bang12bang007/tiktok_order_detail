import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok/widgets/bottom_action_bar.dart';
import 'package:tiktok/widgets/order_status_card.dart';
import 'package:tiktok/widgets/ad_manager_integration_card.dart';
import 'package:tiktok/widgets/promotion_result_card.dart';
import 'package:tiktok/widgets/content_analysis_card.dart';
import 'package:tiktok/widgets/audience_insight_card.dart';
import 'package:tiktok/widgets/resource_card.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  String _refreshStatus = ''; // '', 'refreshing', 'completed'

  Future<void> _handleRefresh() async {
    setState(() {
      _refreshStatus = 'refreshing';
    });

    // Mock network reload call
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _refreshStatus = 'completed';
    });

    // Show 'Làm mới thành công' for a second before closing
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() {
      _refreshStatus = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar to dark icons on transparent background for Android/iOS matching
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8), // TikTok page background light grey
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF161823),
            size: 20,
          ),
          onPressed: () {
            // Action to go back
          },
        ),
        title: const Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF161823),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Action to view profile / account details
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(right: 16.0), // Padding to match right edge
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person_outlined,
                              color: Color(0xFF161823),
                              size: 26,
                            );
                          },
                        ),
                      ),
                    ),
                    // Red Notification Badge Dot matching screenshot
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFE2C55), // Vibrant TikTok notification red
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        // Subtle bottom border on app bar to separate from content
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFF1F1F3),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          // Refresh Status Text Container (under Appbar)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _refreshStatus.isNotEmpty ? 36.0 : 0.0,
            width: double.infinity,
            color: const Color(0xFFF8F8F8),
            alignment: Alignment.center,
            child: Text(
              _refreshStatus == 'refreshing'
                  ? 'Đang làm mới'
                  : (_refreshStatus == 'completed' ? 'Làm mới thành công' : ''),
              style: const TextStyle(
                fontSize: 13.0,
                color: Color(0xFF86878B),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              strokeWidth: 0.0,
              displacement: 0.0,
              onRefresh: _handleRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(), // Pull down is always active
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: const [
                      OrderStatusCard(),
                      SizedBox(height: 12),
                      AdManagerIntegrationCard(),
                      SizedBox(height: 12),
                      PromotionResultCard(),
                      SizedBox(height: 12),
                      // ContentAnalysisCard(),
                      // SizedBox(height: 12),
                      AudienceInsightCard(),
                      SizedBox(height: 12),
                      ResourceCard(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomActionBar(),
    );
  }
}
