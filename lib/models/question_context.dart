class QuestionContext {
  final String sessionId; // Unique ID for the session
  final String userId; // AppUser UID
  final List<Message> messages;

  QuestionContext({
    required this.sessionId,
    required this.userId,
    this.messages = const [], // Initialize with an empty list
  });
}

class Message {
  final String role; // "user" or "assistant"
  final String content;

  Message({required this.role, required this.content});
}
