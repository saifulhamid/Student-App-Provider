import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/model/model.dart';

class StudentDetailsProvider with ChangeNotifier {

  List<StudentDetails> studentList = [];
  List<StudentDetails> filteredList = [];

  List<StudentDetails> get studentDetailsList => studentList;

  void addStudent(StudentDetails values) {
    studentList.add(values);
    notifyListeners();
  }

  void deleteStudent(int index) {
    studentList.removeAt(index);
    notifyListeners();
  }

  void updateStudent(int index, StudentDetails values) {
    studentList.removeAt(index);
    studentList.insert(index, values);
    notifyListeners();

  }

  void updateData() {
    if (filteredList.isEmpty) {
      filteredList = List.from(studentList);
    }
  }

  void updateSearch(String query) {
    if (query.isEmpty) {
      filteredList = List.from(studentList);
    } else {
      filteredList.clear();
      filteredList.addAll(studentList.where((student) => student.name.toLowerCase().contains(query.toLowerCase())));
    }
    notifyListeners();
  }

}

class StudentImageProvider with ChangeNotifier {

  XFile? _image;
  ImagePicker picker = ImagePicker();
  List<StudentDetails> studentList = [];

  XFile? get studentImage => _image;

  Future<void> pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    _image = image;
    notifyListeners();
  }

  Future<void> clearImage({XFile? image}) async {
    _image = image;
    notifyListeners();
  }



}