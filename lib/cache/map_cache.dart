import 'package:uplabs/cache/cache.dart';

class MapCache<K, V> extends Cache<K, V> {
  final Map<K, V> valuesByKey = Map();

  @override
  void set(K key, V value) => valuesByKey[key] = value;

  @override
  V get(K key) => valuesByKey[key];
}