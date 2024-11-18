import 'package:flutter/material.dart';

class InfoWidgets extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color containerColor;

  const InfoWidgets({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "SFProDisplay"
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontFamily: "SFProDisplay"
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Acción del botón
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buttonText, style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w400, color: Colors.black),),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}