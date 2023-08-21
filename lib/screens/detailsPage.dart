import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/screens/editStudent.dart';
import 'package:student_app_provider/styles/refactors.dart';

import '../provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  const DetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,)
        ),
        title: appBarStyle('Student Details', Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditStudents(index: index,),));
              },
              icon: Icon(Icons.edit, color: Colors.white,)
          )
        ],
      ),
      body: Consumer<StudentDetailsProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxes(height: 50),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.blueGrey,
                    image: DecorationImage(
                        image: FileImage(File(value.studentList[index].image))
                    )
                ),
              ),
              sizedBoxes(height: 30),
              detailsPageText(text: value.studentList[index].name, fontSize: 40, fontWeight: FontWeight.bold),
              sizedBoxes(height: 10),
              detailsPageText(text: value.studentList[index].age.toString(), fontSize: 20),
              sizedBoxes(height: 10),
              detailsPageText(text: value.studentList[index].batch, fontSize: 20),
              sizedBoxes(height: 10),
              detailsPageText(text: value.studentList[index].number.toString(), fontSize: 20)
            ],
          );
        },
      )
    );
  }
}
