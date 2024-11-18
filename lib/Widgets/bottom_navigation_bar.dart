import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0, 
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), 
            spreadRadius: 0, 
            blurRadius: 7.6, 
            offset: Offset(0, -0.5), 
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,  
          children: <Widget>[
            _buildItem(0, 'calendar.svg', 'Calendar'),
            _buildItem(1, 'map.svg', 'Map'),
            _buildItem(2, 'plus.svg', 'Plus', isLarge: true),  
            _buildItem(3, 'users.svg', 'Users'),
            _buildItem(4, 'star.svg', 'Star'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index, String iconName, String label, {bool isLarge = false}) {
    double iconSize = isLarge ? 32.0 : 26.0; 

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'lib/Assets/Icons/$iconName',
            height: iconSize,  
            width: iconSize,
          ),
        ],
      ),
    );
  }
}