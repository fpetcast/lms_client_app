class Course {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String instructor;

  Course(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.instructor});

  factory Course.fromJson(Map<String, dynamic> json) {
    print('MODEL');
    print(json);
    return Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        instructor: json['instructor']);
  }
}
