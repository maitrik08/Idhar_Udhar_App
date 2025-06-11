import 'package:flutter/material.dart';




class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  final List<_SupportItem> supportItems = const [
    _SupportItem(
      icon: Icons.help_outline,
      title: 'FAQs',
      subtitle: 'Find answers to common questions',
      path: '/faqscreen'
    ),
    _SupportItem(
      icon: Icons.chat_bubble_outline,
      title: 'Chat with Support',
      subtitle: 'Chat with a support agent',
        path: '/chatsupport'
    ),
    _SupportItem(
      icon: Icons.call_outlined,
      title: 'Call Support',
      subtitle: 'Call us for immediate assistance',
        path: '/callsupport'
    ),
    _SupportItem(
      icon: Icons.email_outlined,
      title: 'Email Us',
      subtitle: 'Send us an email with your query',
        path: '/emailsupport'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Help & Support',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: supportItems.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = supportItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B3434),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(item.icon, color: Colors.white, size: 20),
                          ),
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          item.subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, item.path);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String path;

  const _SupportItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.path,
  });
}
