class Post {
  int id;
  String title;
  String body;

  Post(this.id, this.title, this.body);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
