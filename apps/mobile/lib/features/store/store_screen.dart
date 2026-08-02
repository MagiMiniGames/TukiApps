import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: const [
          _StoreCard(
            name: 'Tropical Paradise',
            category: 'Wellness',
            description:
                'A peaceful virtual escape with calming visuals and soft ambient sounds.',
            rating: '4.9',
          ),
          SizedBox(height: 14),
          _StoreCard(
            name: 'Gratitude Daily',
            category: 'Journal',
            description:
                'A gentle daily gratitude practice designed for calm and consistency.',
            rating: '4.8',
          ),
          SizedBox(height: 14),
          _StoreCard(
            name: 'Focus Flow',
            category: 'Productivity',
            description:
                'Soft focus sessions without pressure or harsh timers.',
            rating: '4.7',
          ),
          SizedBox(height: 14),
          _StoreCard(
            name: 'Breath Space',
            category: 'Mindfulness',
            description:
                'Simple guided breathing with beautiful tropical atmospheres.',
            rating: '4.9',
          ),
        ],
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final String name;
  final String category;
  final String description;
  final String rating;

  const _StoreCard({
    required this.name,
    required this.category,
    required this.description,
    required this.rating,
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
          // Title + Category
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.primarySoft,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: TextStyle(
              fontSize: 14.5,
              height: 1.45,
              color: Colors.grey.shade800,
            ),
          ),

          const SizedBox(height: 16),

          // Rating + Get button
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get',
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
