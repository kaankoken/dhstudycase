abstract class IUseCase<K, V> {
  Future<K> invoke(V param);
}
