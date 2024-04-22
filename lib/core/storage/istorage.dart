abstract class CacheStorage {
  ///this function would be specific for cache only
  Future<String?> getDownloads();
  Future<void> saveDownloads(String downloads);
    Future<void> removeFavorite(String symbol);
    Future<void> saveOnboarding(bool status);
    Future<bool?> getOnboarding();
}