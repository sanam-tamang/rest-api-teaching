class Post {
  final int id;
  final String? slug;
  final String title;
  final String content;
  final String image;
  final String thumbnail;

  Post(
      {required this.id,
      this.slug,
      required this.title,
      required this.content,
      required this.image,
      required this.thumbnail});

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      slug: map['slug'], 
      title: map['title'],
      content: map['content'],
      image: map['image'],
      thumbnail: map['thumbnail'],
    );
  }
}

void a() {
  Map<String, dynamic> map = {
    'id': 1,
    'slug': "sfsd",
    'title': "sfsf",
    'content': 'sfsf',
    'image': 'dsfsdf',
    'thumbnail': 'fsdf'
  };

  Post p = Post.fromMap(map);


}
