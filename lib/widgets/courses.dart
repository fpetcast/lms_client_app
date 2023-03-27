import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> _courses = [
    Course('Course A', 'John Doe', 'assets/images/course_a.jpg'),
    Course('Course B', 'Jane Smith', 'assets/images/course_b.jpg'),
    Course('Course C', 'Bob Johnson', 'assets/images/course_c.jpg'),
    Course('Course D', 'Sarah Lee', 'assets/images/course_d.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: _courses.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return CourseCard(course: _courses[index]);
        },
      ),
    );
  }
}

class Course {
  final String title;
  final String instructor;
  final String imageUrl;

  Course(this.title, this.instructor, this.imageUrl);
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to course details page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'By ${course.instructor}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
