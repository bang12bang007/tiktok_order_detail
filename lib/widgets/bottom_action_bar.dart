import 'package:flutter/material.dart';
import 'package:tiktok/main.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1D1F24) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.04),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF1F1F3), 
            width: 1.0,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 8.0),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // Toggle between Dark and Light Mode dynamically
                MyApp.of(context)?.toggleTheme();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFE2C55),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Quảng bá lại'),
            ),
          ),
        ),
      ),
    );
  }
}
