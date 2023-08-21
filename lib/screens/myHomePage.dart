import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/screens/addStudents.dart';
import 'package:student_app_provider/screens/search.dart';
import 'package:student_app_provider/styles/refactors.dart';

import '../provider/provider.dart';
import 'detailsPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarStyle('Student List', Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),)),
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
          ),
          sizedBoxes(width: 20)
        ],
      ),
      body: Consumer<StudentDetailsProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: value.studentList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(index: index,),));
                  },
                  child: ListTile(
                    title: Text(value.studentList[index].name),
                    subtitle: Text(value.studentList[index].batch),
                    trailing: IconButton(onPressed: (){
                      value.deleteStudent(index);
                    },
                        icon: const Icon(Icons.delete, color: Colors.red,)),
                  ),
                );
              },
            ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddStudents(),)),
          child: Icon(Icons.add)
      
      ),
    );
    
  }
}
