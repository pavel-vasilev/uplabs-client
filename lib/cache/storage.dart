import 'package:uplabs/cache/cache.dart';

class Storage {
  final List<Cache<dynamic, dynamic>> caches;

  Storage(this.caches);

  V get<K, V>(K key) {
    return caches
        .firstWhere((cache) => cache is Cache<K, V>, orElse: () => null)
        ?.get(key);
  }

  void set<K, V>(K key, V value) {
    caches
        .firstWhere((cache) => cache is Cache<K, V>, orElse: () => null)
        ?.set(key, value);
  }
}