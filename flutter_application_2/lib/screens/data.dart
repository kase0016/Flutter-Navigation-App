import 'package:flutter/material.dart';
import 'dart:async';
import '../data/http_helper.dart';
import '../data/user.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<User> user = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  // Function to fetch users
  Future<void> fetchUsers() async {
    HttpHelper httpHelper = HttpHelper();
    try {
      // Fetch 10 users
      List<User> fetchedUsers = await httpHelper.fetchUsers(15);
      setState(() {
        user = fetchedUsers; // Update the users list
        isLoading = false; // Set loading to false once data is fetched
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load users: $e'; // Set error message
        isLoading = false; // Set loading to false on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Data Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: user.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      '${user[index].first_name} ${user[index].last_name}'),
                  subtitle: Text(user[index].email),
                );
              },
            ),
          ),
          const Divider(
            color: Color.fromARGB(96, 0, 0, 0),
          )
        ],
      ),
    );
  }
}
