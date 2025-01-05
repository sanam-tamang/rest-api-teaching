class Post {
  final int id;
  final String title;
  final String content;
  Post({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}

