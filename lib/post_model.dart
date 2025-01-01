// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final int id;
  final String title;
  final String content;
  final String imageUrl;
  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['image']

    );
  }
}
