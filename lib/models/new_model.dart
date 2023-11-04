class NewModel {
  final String articleId;
  final String title;
  final String description;
  final String content;
  final String publicDate;

  NewModel({
    required this.articleId,
    required this.title,
    required this.description,
    required this.content,
    required this.publicDate,
  });
  factory NewModel.fromJson(Map<String, dynamic> json) {
    return NewModel(
        articleId: json['article_id'],
        title: json['title'],
        description: json['description'],
        content: json['content'],
        publicDate: json['pubDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'article_id': articleId,
      'title': title,
      'description': description,
      'content': content,
      'pubDate': publicDate,
    };
  }
}
