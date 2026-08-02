import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _AppCard(
            title: 'Tropical Paradise',
            subtitle: 'Shared by Lunos',
            description: 'A calm virtual escape with beautiful visuals and soft sounds.',
          ),
          SizedBox(height: 16),
          _AppCard(
            title: 'Gratitude Daily',
            subtitle: 'Shared by Maya',
            description: 'Simple daily gratitude journal with soft tropical design.',
          ),
          SizedBox(height: 16),
          _AppCard(
            title: 'Focus Flow',
            subtitle: 'Shared by Kai',
            description: 'Gentle focus timer designed for deep work without pressure.',
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const _AppCard({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View App'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
