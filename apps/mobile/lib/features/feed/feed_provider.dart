import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedItem {
  final String id;
  final String title;
  final String subtitle;

  const FeedItem({required this.id, required this.title, required this.subtitle});
}

class FeedNotifier extends StateNotifier<List<FeedItem>> {
  FeedNotifier() : super(_mockItems);

  void addItem(FeedItem item) => state = [item, ...state];
  void remove(String id) => state = state.where((i) => i.id != id).toList();
}

final feedProvider = StateNotifierProvider<FeedNotifier, List<FeedItem>>((ref) {
  return FeedNotifier();
});

const List<FeedItem> _mockItems = [
  FeedItem(id: '1', title: 'Pocket Paint', subtitle: 'Lightweight drawing app people love'),
  FeedItem(id: '2', title: 'Focus Timer', subtitle: 'Simple pomodoro with sounds'),
  FeedItem(id: '3', title: 'Habit Pop', subtitle: 'Tiny habit tracker'),
];
