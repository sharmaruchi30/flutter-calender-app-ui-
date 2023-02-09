
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/calender_time_provider.dart';

class TimeCard extends StatefulWidget {
  Map tasks;
  List tasksList6am;
  String time_for_card;
  Color dividerColor;
  int index;
  TimeCard(
      {super.key,
      required this.tasks,
      required this.tasksList6am,
      required this.time_for_card,
      required this.index ,
      required this.dividerColor
      });

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  late TextEditingController addTaskbtn;

  @override
  void initState() {
    
    super.initState();
    addTaskbtn = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    addTaskbtn.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         VerticalDivider(
          width: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: widget.dividerColor
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.time_for_card,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),

            // ignore: sized_box_for_whitespace
            task_list(),

            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border:
                    Border.all(color: widget.dividerColor),
              ),
              child: GestureDetector(
                  onTap: (() {
                    // Navigator.push(context, MaterialPageRoute(builder: ((context) => AddTask(TappedIndex: widget.index))));
                    addTask(widget.index);
                    
                  }),
                  child:  Icon(
                    CupertinoIcons.add,
                    color: widget.dividerColor,
                  )),
            )
          ],
        ),
      ],
    );
  }

  Widget task_list() {
    for (int i in widget.tasks.keys ){
    if (widget.index == i) {
      return Consumer<SelectedTimeChangeProvider>(builder: (context, value, child){
        return Container(
        height: 120,
        width: widget.tasks[i].isNotEmpty ? 100:50 ,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.tasks[i].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    onTaskTap(widget.index , widget.tasks);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: widget.dividerColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.tasks[i][index],
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
      });
    } 
    }
    return Container(
        height: 120,
        width: 50,
      );
  }


  Future addTask(int TappedIndex) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Add Task"),
            content: TextField(
              controller: addTaskbtn,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    try{
                       widget.tasks[TappedIndex].add(addTaskbtn.text);
                    
                    }
                    on NoSuchMethodError{
                       widget.tasks[TappedIndex] =[addTaskbtn.text];
                    }
                    // ignore: empty_catches
                    catch(e){

                    }
                    
                    finally{
                    
                    Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ))
            ],
          ));

  Future onTaskTap(int index , addTaskProvider) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Edit Task"),
            content: TextField(
              controller: addTaskbtn,
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text("Ok")),
              TextButton(
                  onPressed: () {
                    widget.tasks[index].remove(addTaskbtn.text);
                    // widget.tasks.remove(addTaskbtn.text);
                    Navigator.pop(context);
                  },
                  child: Text("Delete")),
            ],
          ));
}
