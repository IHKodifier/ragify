enum KnowledgeSourceType { pdf, json, csv, excel, website }

class KnowledgeSource {
  final String id; // Unique ID (can be Firestore document ID)
  final String name;
  final KnowledgeSourceType type;
  final String sourceUrl; // URL for website or file storage location
  final int crawlDepth; // For websites
  final DateTime createdAt;
  final DateTime? lastUpdated; // For tracking updates
  // ... other metadata (e.g., file size, processing status)

  KnowledgeSource({
    required this.id,
    required this.name,
    required this.type,
    required this.sourceUrl,
    this.crawlDepth = 1, // Default crawl depth
    required this.createdAt,
    this.lastUpdated,
    // ... other metadata
  });
}
