class SearchResult {
  final String answer;
  final List<String> relevantSources; // IDs of KnowledgeSources
  final double confidenceScore; // Optional: Confidence level of the answer

  SearchResult({
    required this.answer,
    required this.relevantSources,
    this.confidenceScore = 0.0,
  });
}
