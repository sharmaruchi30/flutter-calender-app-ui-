import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  int TappedIndex;
  AddTask({
    Key? key,
    required this.TappedIndex,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 40),
            child: Column(
              children: [
                TextField(
                  autofocus: false,
                 decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Title",
                  
                 ),
                )
              ],
            ),
          ),
        ),
    );
  }
}