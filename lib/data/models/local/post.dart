class Post {
  Post(this.id, this.title, this.body);

  int id;
  String title;
  String body;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
