import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE7D9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7D9F7),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 14,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info, color: Colors.teal, size: 34),
              const SizedBox(height: 12),

              Text(
                'About RuMind',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                '''
RuMind is your smart financial companion powered by AI.

✨ Features:
• Track your spending
• Analyze financial habits
• Get AI-powered insights
• Set and achieve financial goals

This is a placeholder description. You can edit this section anytime to reflect your real app vision.

Version: 1.0.0
''',
                style: TextStyle(height: 1.5),
              ),

              const Spacer(),

              Center(
                child: Text(
                  'Made with ❤️ using Flutter',
                  style: theme.textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}