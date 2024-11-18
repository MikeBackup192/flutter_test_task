import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onNotificationTap;

  const TopBar({
    Key? key,
    required this.title,
    required this.onNotificationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('E, MMM d').format(DateTime.now());

    return LayoutBuilder(
      builder: (context, constraints) {
        
        double screenWidth = constraints.maxWidth;
        double appBarHeight = screenWidth < 800 ? 100 : 150;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentDate,
                        style: const TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Builder(
                    builder: (context) {
                      if (constraints.maxWidth < 600) {
                        return Row(
                        children: [
                          GestureDetector(
                            onTap: onNotificationTap,
                            child: SvgPicture.asset(
                              'lib/Assets/Icons/bell.svg',
                              height: 25.0,
                              width: 25.0,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipOval(
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey, width: 1),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                      } else {
                    return SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(120);  
  }
}