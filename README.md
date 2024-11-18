# townsquare_flutter_project

A new Flutter project.

## Overview

This screen is part of a Flutter application designed to display various events taking place during the week in Estepona. The main functionalities include viewing event details, filtering events by category, and exploring the UI of the app.

## Features
Responsive Layout: The screen is designed to adapt to different screen sizes (mobile, tablet, desktop). On larger screens, the layout uses a sidebar for navigation, while on smaller screens, it uses a bottom navigation bar.

Event Timeline: The core functionality of the HomeScreen is a timeline view that displays events happening on different days of the week. Users can see the title, time, location, spots available, and more details for each event.

Event Filtering: Users can filter events by categories (e.g., sports, food, popular) to view only events of interest.

Search: A search bar is provided to help users search for specific events.

Goals Widget: Displays goals or tasks the user needs to complete, related to the event participation.

Custom Widgets: The screen uses various custom widgets for events, navigation, goals, and informational sections, providing a unique user interface for this app.

## Some of the components i used

TimelineWidget: Displays the events organized by day. It dynamically loads the events based on the selected category and the current date.

Event Cards: Cards represent each event, showing key details like time, location, and intensity.

Filters: Users can select event categories to filter the displayed events, making it easier to find relevant activities.

Responsive Navigation: The screen adjusts the layout based on the screen size, showing either a vertical navigation bar or a bottom navigation bar for smaller screens.

## Structure
The main components i created for this task were:

Top Bar: Displays the title of the current view and provides notification support.

Search Bar: Allows users to search for specific events or activities.

Horizontal Scroll Categories: Displays a list of categories (e.g., Sports, Food, Popular) that users can filter the events by.

Timeline: Displays the day's events in a scrollable format. Each day has its own set of events, and if no events are scheduled, an empty card is shown.

Goals Widget: Displays tasks or goals related to the user’s event participation.

Info Widgets: Provides additional information, like weekly workshops or popular events nearby.

# Setup and Installation
On terminal ->

Clone the repository:
"git clone <repository_url>"

Install the required dependencies:
"flutter pub get"

Run the application:
"flutter run"


