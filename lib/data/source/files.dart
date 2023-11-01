abstract class Files {
  Future<String?> read(String path);
  Future<void> write(String path, String contents);
  Future<void> delete(String path);
}
