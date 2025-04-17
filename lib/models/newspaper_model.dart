class Newspaper{
  final int id;
  final String newspaperName;
  final String newspaperDescription;
  final String newspaperImageUrl;
  bool handOver;

  Newspaper({
    required this.id,
    required this.newspaperName,
    required this.newspaperDescription,
    required this.newspaperImageUrl,
    required this.handOver});
}