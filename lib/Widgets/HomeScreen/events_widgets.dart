import 'package:flutter/material.dart';

class EventsWidgets extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String backgroundImage; 

  const EventsWidgets({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage), 
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              fontFamily: "SFProDisplay",
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 180.0),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontFamily: "SFProDisplay",
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(8.0), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4.0,
                        offset: Offset(0, 2), 
                      ),
                    ],
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontFamily: "SFProDisplay",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}