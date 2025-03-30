class HistoricalPlace {
  final String id;
  final List<String> imagePaths;
  final Map<String, String> title;
  final Map<String, String> description;
  final Map<String, String> history;

  HistoricalPlace({
    required this.id,
    required this.imagePaths,
    required this.title,
    required this.description,
    required this.history,
  });
}