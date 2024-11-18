import 'dart:math';

import 'package:flutter/material.dart';
import 'package:townsquare_flutter_project/Widgets/Graphics/circle_porcentage.dart';

class GoalsWidget extends StatelessWidget {
  double get percentage => 0.27;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 235, 255),  
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12), 
              offset: Offset(3, 3), 
              blurRadius: 8, 
              spreadRadius: 1, 
            ),
          ],  
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You’re close to your goal!',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),  
                    fontSize: 16,  
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SFProDisplay',  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                  child: Text(
                    'Join more sport activities to\ncollect more points',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontSize: 14, 
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProDisplay', 
                    ),
                    softWrap: true,  
                    maxLines: 3,    
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), 
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: const Text(
                        'Join Now',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'SFProDisplay',), 
                      ),
                    ),
                    const SizedBox(width: 16), 
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), 
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: const Text(
                        'My Points',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'SFProDisplay',), 
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CustomPaint(
                size: Size(80, 80), 
                painter: PercentageCirclePainter(percentage),
                //child: Text(
                //  '${(percentage * 100).toStringAsFixed(0)}%', // Muestra el porcentaje dentro
                //  style: const TextStyle(
                //    fontSize: 30,
                //    fontWeight: FontWeight.bold,
                //    color: Colors.black,
                //  ),
                //),
              ),
            )
          ],
        ),
      ),
    );
  }
}

