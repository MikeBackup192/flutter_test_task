import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:townsquare_flutter_project/Widgets/HomeScreen/events_widgets.dart';
import 'package:townsquare_flutter_project/Widgets/HomeScreen/searching_bar_home.dart';
import 'package:townsquare_flutter_project/Widgets/empty_events_card.dart';
import 'package:townsquare_flutter_project/Widgets/event_cards.dart';
import 'package:townsquare_flutter_project/Widgets/filters_scroll_list.dart';
import 'package:townsquare_flutter_project/Widgets/goals_widget.dart';
import 'package:townsquare_flutter_project/Widgets/info_widgets.dart';
import 'package:townsquare_flutter_project/Widgets/timeline_widget.dart';
import 'package:townsquare_flutter_project/Widgets/top_bar.dart';
import 'package:townsquare_flutter_project/Widgets/vertical_navigation_column.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart'; 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final FocusNode _focusNode = FocusNode();
  String _selectedCategory = EventCategory.All.toString().split('.').last;

  List<Map<String, dynamic>> _generateTimelineData() {
  final List<Map<String, dynamic>> timelineData = [];
  final DateTime now = DateTime.now();
  final DateFormat dayFormatter = DateFormat('EEEE', 'en');

  //Test Events
  final List<Map<String, dynamic>> allEvents = [
    {
      'title': "Beach Yoga",
      'time': "08:00 (60 min)",
      'location': "La Playa de la Rada",
      'spots': 8,
      'intensity': 0,
      'price': "9€",
      'date': now, 
      'childcare': false,
      'category': EventCategory.Calm,
    },
    {
      'title': "Reformer Pilates",
      'time': "9:00 (60 min)",
      'location': "Wellness Studios",
      'spots': 0,
      'intensity': 1,
      'price': "15€",
      'date': now, 
      'childcare': true,
      'category': EventCategory.Sports,
    },
    {
      'title': "Tiky Taco",
      'time': "17:00 (60 min)",
      'location': "La Playa de la Rada",
      'spots': 8,
      'intensity': 0,
      'price': "9€",
      'date': now, 
      'childcare': true,
      'category': EventCategory.Food,
    },
    {
      'title': "5-a-side Footballs",
      'time': "12:30 (15 min)",
      'location': "Municipal Sports Center",
      'spots': 0,
      'intensity': 2,
      'price': "19€",
      'date': now, 
      'childcare': true,
      'category': EventCategory.Sports,
    },
    {
      'title': "HIIT Workout",
      'time': "10:00 (45 min)",
      'location': "City Gym",
      'spots': 5,
      'intensity': 2,
      'price': "12€",
      'date': DateTime.parse("2024-11-18"), 
      'childcare': false,
      'category': EventCategory.Sports,
    },
    {
      'title': "Music Experience",
      'time': "10:45 (45 min)",
      'location': "City Yung",
      'spots': 5,
      'intensity': 1,
      'price': "15€",
      'date': DateTime.parse("2024-11-18"), 
      'childcare': false,
      'category': EventCategory.Popular,
    },
    {
      'title': "Standing Tapas Lunch",
      'time': "10:45 (45 min)",
      'location': "City Gym",
      'spots': 5,
      'intensity': 0,
      'price': "12€",
      'date': DateTime.parse("2024-11-19"), 
      'childcare': true,
      'category': EventCategory.Food,
    },
  ];

  final filteredEvents = allEvents.where((event) {
    if (_selectedCategory == EventCategory.All.toString().split('.').last) {
      return true; 
    } else {
      return event['category'].toString().split('.').last == _selectedCategory;
    }
  }).toList();

  
  for (int i = 0; i < 7; i++) {
    final DateTime day = now.add(Duration(days: i));
    final String dayLabel = i == 0
        ? "Today/${dayFormatter.format(day)}"
        : dayFormatter.format(day);

    
    final eventsForDay = filteredEvents.where((event) {
      final DateTime eventDate = event['date'];
      return eventDate.year == day.year &&
          eventDate.month == day.month &&
          eventDate.day == day.day;
    }).map((event) {
      return EventCard(
        title: event['title'],
        time: event['time'],
        location: event['location'],
        spots: event['spots'],
        intensityLevel: event['intensity'],
        price: event['price'],
        date: event['date'],
        childcare: event["childcare"],
        category: event["category"],
      );
    }).toList();

    
    if (eventsForDay.isEmpty) {
      eventsForDay.add(EmptyEventCard());
    }

    timelineData.add({
      'label': dayLabel,
      'events': eventsForDay,
    });
  }

  return timelineData;
}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final timelineData = _generateTimelineData();

        return GestureDetector(
          onTap: _dismissKeyboard,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: constraints.maxWidth > 800
                ? null
                : TopBar(
                    title: 'This week in Estepona',
                    onNotificationTap: () {
                      print('Notificación presionada');
                    },
                  ),
            body: constraints.maxWidth > 800
                ? Row(
                    children: [
                      CustomVerticalMenu(
                        currentIndex: _selectedIndex,
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Column(
                                    children: [
                                      TopBar(
                                        title: 'This week in Estepona',
                                        onNotificationTap: () {
                                          print('Notificación presionada');
                                        },
                                      ),
                                      if (constraints.maxWidth < 800) GoalsWidget(),
                                      SearchWidget(focusNode: _focusNode),
                                      HorizontalScrollCategories(
                                        onCategorySelected: (EventCategory selectedCategory) {
                                          setState(() {
                                            _selectedCategory = selectedCategory.toString().split('.').last;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: timelineData.map((dayData) {
                                            return TimelineWidget(
                                              label: dayData['label'],
                                              children: dayData['events'],
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                              if (constraints.maxWidth > 1450)
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        child: GoalsWidget(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                                        child: InfoWidgets(
                                          title: 'Weekly workshops\nfor kids',
                                          subtitle:
                                              'Sign up for early access to weekly activities for your kids full of learning and fun!',
                                          buttonText: 'Learn more',
                                          containerColor: Color.fromARGB(255, 251, 242, 192),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                                        child: EventsWidgets(
                                          title: "Popular events near you!",
                                          subtitle:
                                              "Unleash the fun! Explore the world of exciting events happening near you.",
                                          buttonText: "See more",
                                          backgroundImage: "lib/Assets/imgs/events_image.jpg",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        GoalsWidget(),
                        SearchWidget(focusNode: _focusNode),
                        HorizontalScrollCategories(
                          onCategorySelected: (EventCategory selectedCategory) {
                            setState(() {
                              _selectedCategory = selectedCategory.toString().split('.').last;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: timelineData.map((dayData) {
                              return TimelineWidget(
                                label: dayData['label'],
                                children: dayData['events'],
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
            bottomNavigationBar: constraints.maxWidth > 800 
                ? null
                : CustomBottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
          ),
        );
      },
    );
  }

  void _dismissKeyboard() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
  }
}