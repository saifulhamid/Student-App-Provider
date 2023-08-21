import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/styles/refactors.dart';
import '../provider/provider.dart';
import 'detailsPage.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<StudentDetailsProvider>(context, listen: false).updateData();


  }

  @override
  Widget build(BuildContext context) {
    final studentDetails = Provider.of<StudentDetailsProvider>(context, listen: false);
    // final studentList = studentDetails.studentList;
    // final query = searchController.text;
    return Scaffold(
      appBar: AppBar(
        title: appBarStyle('Search Students', Colors.white),
        centerTitle: true ,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<StudentDetailsProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              children: [
                TextFormField(
                  onChanged: (query) {
                    studentDetails.updateSearch(query);
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                      hintText: 'Search students',
                      border: OutlineInputBorder()
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: studentDetails.filteredList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailsPage(index: index,),)
                          );
                        },
                        child: ListTile(
                          title: Text(studentDetails.filteredList[index].name),
                          subtitle: Text(studentDetails.filteredList[index].batch),
                          trailing: IconButton(onPressed: (){
                            value.deleteStudent(index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red,)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },

        ),
      ),
    );
  }
}
