import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomVerticalMenu extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomVerticalMenu({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, 
      color: Colors.black, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 25, left: 50),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 40, 
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFProDisplay', 
                  ),
                  children: [
                    TextSpan(
                      text: 'TWN',
                      style: TextStyle(color: Colors.white), 
                    ),
                    TextSpan(
                      text: 'SQR',
                      style: TextStyle(color: Color.fromARGB(255, 53, 186, 248)), 
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            _buildMenuItem(0, 'calendar.svg', 'Activities'),
            _buildMenuItem(1, 'map.svg', 'Locations'),
            _buildMenuItem(2, 'star.svg', 'Services'),
            _buildMenuItem(3, 'users.svg', 'Communities'),
            _buildMenuItem(4, 'bell.svg', 'Notifications'),
            ],),
          ),
          
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 55.0),
            child: ElevatedButton.icon(
              onPressed: () => onTap(5),
              icon: const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
              label: const Text(
                "Create",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20, fontFamily: "SFProDisplay"),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 53, 186, 248), 
                minimumSize: const Size(double.infinity, 48), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/profile.jpg'),
                  radius: 24.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, String iconName, String label) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'lib/Assets/Icons/$iconName',
                height: 24.0,
                width: 24.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: currentIndex == index ? Colors.white : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}