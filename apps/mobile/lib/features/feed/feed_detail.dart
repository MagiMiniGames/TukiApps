import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feed_provider.dart';

class FeedDetailScreen extends ConsumerWidget {
  final String itemId;

  const FeedDetailScreen({required this.itemId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(feedProvider);
    final item = items.firstWhere(
      (i) => i.id == itemId,
      orElse: () => FeedItem(id: itemId, title: 'Unknown', subtitle: ''),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(item.title)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            item.subtitle.isNotEmpty ? item.subtitle : 'No details yet.',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
