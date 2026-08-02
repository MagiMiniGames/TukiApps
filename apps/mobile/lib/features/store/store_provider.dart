import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreItem {
  final String id;
  final String title;
  final String subtitle;

  const StoreItem({required this.id, required this.title, required this.subtitle});
}

class StoreNotifier extends StateNotifier<List<StoreItem>> {
  StoreNotifier() : super(_mockStore);

  void add(StoreItem item) => state = [item, ...state];
  void remove(String id) => state = state.where((i) => i.id != id).toList();
}

final storeProvider = StateNotifierProvider<StoreNotifier, List<StoreItem>>((ref) {
  return StoreNotifier();
});

const List<StoreItem> _mockStore = [
  StoreItem(id: 's1', title: 'Plugin Pack', subtitle: 'Useful plugins & assets'),
  StoreItem(id: 's2', title: 'Theme Kit', subtitle: 'Prebuilt themes'),
];
