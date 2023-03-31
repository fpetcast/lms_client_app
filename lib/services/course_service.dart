import 'dart:convert';
//import 'dart:io';
//import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import '../models/course_model.dart';

class CourseService {
  //static const _baseUrl = 'https://example.com/api';

  static Future<List<Course>> getCourses() async {
    //final url = Uri.parse('$_baseUrl/courses');
    //final response = await http.get(url);
    final String fakeJsonString =
        await rootBundle.loadString('assets/data/courses.json');
    final Map<String, dynamic> fakeJsonData = await json.decode(fakeJsonString);
    print(fakeJsonData["status"]);
    if (fakeJsonData["status"]) {
      final List<Course> curses = mapCourses(fakeJsonData['data']['courses']);
      return curses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  static List<Course> mapCourses(List<dynamic> courses) {
    print(courses);
    return courses.map((json) => Course.fromJson(json)).toList();
  }
}
