import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  final FocusNode focusNode;

  SearchWidget({required this.focusNode});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  void _focusNodeListener() {
    if (widget.focusNode.hasFocus) {
      setState(() {
        _isFocused = true; 
      });
    } else {
      setState(() {
        _isFocused = false; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12), 
              offset: Offset(3, 3), 
              blurRadius: 8, 
              spreadRadius: 0.5, 
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: widget.focusNode, 
                decoration: InputDecoration(
                  hintText: 'What do you feel like doing?',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 173, 181, 189),
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                
                print("Icono tocado");
              },
              child: SvgPicture.asset(
                'lib/Assets/Icons/search.svg', 
                color: Colors.grey, 
                height: 25.0, 
                width: 25.0, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}