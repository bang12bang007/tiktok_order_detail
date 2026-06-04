import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/widgets/bottom_action_bar.dart';
import 'package:tiktok/widgets/order_status_card.dart';
import 'package:tiktok/widgets/ad_manager_integration_card.dart';
import 'package:tiktok/widgets/promotion_result_card.dart';
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
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Set status bar to adapt to light/dark themes
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? Colors.white : const Color(0xFF161823),
            size: 20,
          ),
          onPressed: () {
            // Action to go back
          },
        ),
        title: Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF161823),
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
                        child: SvgPicture.asset(
                          'assets/svg/ic_user_outline.svg', // icon user
                          colorFilter: ColorFilter.mode(
                            isDark ? Colors.white : const Color(0xFF161823),
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.cover,
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                    // Red Notification Badge Dot matching screenshot
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: const Color(0xFFFE2C55), // Vibrant TikTok notification red
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
            color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3),
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
                      // 2 dòng trên này nha :v
                       //SizedBox(height: 10),
                       //AdManagerIntegrationCard(),
                      SizedBox(height: 10),
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
