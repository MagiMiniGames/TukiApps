import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: const [
          _FeedCard(
            title: 'Tropical Paradise',
            sharedBy: 'Shared by Lunos',
            description:
                'A peaceful virtual escape with calming visuals and soft ambient sounds.',
          ),
          SizedBox(height: 14),
          _FeedCard(
            title: 'Gratitude Daily',
            sharedBy: 'Shared by Maya',
            description:
                'A gentle daily gratitude practice designed for calm and consistency.',
          ),
          SizedBox(height: 14),
          _FeedCard(
            title: 'Focus Flow',
            sharedBy: 'Shared by Kai',
            description:
                'Soft focus sessions without pressure or harsh timers.',
          ),
          SizedBox(height: 14),
          _FeedCard(
            title: 'Breath Space',
            sharedBy: 'Shared by Aria',
            description:
                'Simple guided breathing with beautiful tropical atmospheres.',
          ),
        ],
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  final String title;
  final String sharedBy;
  final String description;

  const _FeedCard({
    required this.title,
    required this.sharedBy,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + soft accent
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            sharedBy,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: TextStyle(
              fontSize: 14.5,
              height: 1.45,
              color: Colors.grey.shade800,
            ),
          ),

          const SizedBox(height: 16),

          // Actions
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, size: 18),
                label: const Text('Like'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey.shade700,
                ),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline, size: 18),
                label: const Text('Comment'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey.shade700,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'View',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
