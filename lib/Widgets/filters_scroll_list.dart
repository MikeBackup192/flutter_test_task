import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:townsquare_flutter_project/Widgets/event_cards.dart';

class HorizontalScrollCategories extends StatefulWidget {
  final Function(EventCategory) onCategorySelected;

  HorizontalScrollCategories({required this.onCategorySelected});

  @override
  _HorizontalScrollCategoriesState createState() =>
      _HorizontalScrollCategoriesState();
}

class _HorizontalScrollCategoriesState
    extends State<HorizontalScrollCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: _buildCategoryButton(0, "lib/Assets/Icons/sliders.svg", null, EventCategory.All),
            ),
            _buildCategoryButton(1, null, 'All', EventCategory.All),
            _buildCategoryButton(2, null, 'Sports', EventCategory.Sports),
            _buildCategoryButton(3, null, 'Food', EventCategory.Food),
            _buildCategoryButton(4, null, 'Kids', EventCategory.Kids),
            _buildCategoryButton(5, null, 'Creative', EventCategory.Creative),
            _buildCategoryButton(6, null, 'Popular', EventCategory.Popular),
            _buildCategoryButton(7, null, 'Calm', EventCategory.Calm),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(int index, String? svgPath, String? label, EventCategory category) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onCategorySelected(category);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 186, 161, 200) : Color.fromARGB(255, 238, 225, 245),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (svgPath != null)
              SvgPicture.asset(
                svgPath,
                color: isSelected ? Colors.black : const Color.fromARGB(255, 0, 0, 0),
                height: 17,
                width: 17,
              ),
            if (svgPath != null) SizedBox(width: 0),
            if (label != null)
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.black : const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'SFProDisplay',
                ),
              ),
            if (label != null) SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}