import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  Color clr ;
   TaskCard({super.key, required this.clr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        height: 220,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          // rgba(173,155,140,255)
          color:clr,
          borderRadius: BorderRadius.circular(28)
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("You have a \nmeeting", 
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 35,),
              Row(  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3:00 PM", 
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24
                      ),
                      ),
                      Text("Start", 
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16
                  ),
                  )
                    ],
                  ),

                Container(
                  height: 40,
                  width: 75,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22)
                  ),

                  child: Center(child: Text("30 Min" , 
                  
                  style:GoogleFonts.poppins(
                    color: clr,
                    fontSize: 16,
                  ) ,
                  ),),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3:30 PM", 
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24
                      ),
                      ),
                      Text("End", 
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16
                  ),
                  )
                    ],
                  ),
                ],
                

                
              )
            ],
          ),
        ),
      ),
    );
  }
}