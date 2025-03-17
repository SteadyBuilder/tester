class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});
  // JSON 데이터를 Dart 객체로 변환하는 메서드
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
