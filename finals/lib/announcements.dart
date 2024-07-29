import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: AnnouncementsPage(),
  ));
}

class AnnouncementsPage extends StatefulWidget {
  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final List<Announcement> announcements = [
    Announcement(
      title: 'Enhancing Services',
      content:
          'We\'re currently enhancing our services to better nurture young minds. Our dedicated team is working hard to bring you an enriched experience in childcare and education. Please check back soon for updates on our programs, activities, and how we\'re shaping the future of early childhood development. Thank you for your patience and understanding.',
      date: DateTime(2024, 7, 12),
      imagePath: 'assets/dswdannouce.jpg',
    ),
    Announcement(
      title: 'Educational Assistance Program',
      content:
          'We\'re excited to introduce our new Educational Assistance Program! This initiative aims to provide vital support to students in need and promote equal access to quality education.',
      date: DateTime(2024, 7, 11),
      imagePath: 'assets/dswdannouce.jpg',
    ),
    Announcement(
      title: 'Center Maintenance',
      content:
          'Our center will be closed for maintenance from July 20 to July 22. We apologize for any inconvenience caused and appreciate your understanding.',
      date: DateTime(2024, 7, 10),
      imagePath: 'assets/dswdannouce.jpg',
    ),
    Announcement(
      title: 'Summer Festival',
      content:
          'Join us for our annual summer festival on August 1! There will be games, food, and fun activities for all ages. We hope to see you there!',
      date: DateTime(2024, 7, 9),
      imagePath: 'assets/dswdannouce.jpg',
    ),
    Announcement(
      title: 'Library Partnership',
      content:
          'We are excited to announce a new partnership with the local library to promote reading and literacy among children. Stay tuned for upcoming events and programs.',
      date: DateTime(2024, 7, 8),
      imagePath: 'assets/dswdannouce.jpg',
    ),
    Announcement(
      title: 'Fall Enrollment',
      content:
          'Our fall enrollment is now open! Register early to secure a spot for your child in our programs. We look forward to welcoming new families.',
      date: DateTime(2024, 7, 7),
      imagePath: 'assets/dswdannouce.jpg',
    ),
  ];

  String searchQuery = '';
  DateTimeRange? dateRange;
  bool showFavorites = false;
  final Set<int> favoriteIndices = {};

  @override
  Widget build(BuildContext context) {
    List<Announcement> filteredAnnouncements =
        announcements.where((announcement) {
      bool matchesQuery =
          announcement.title.toLowerCase().contains(searchQuery.toLowerCase());
      bool withinDateRange = dateRange == null ||
          (announcement.date.isAfter(dateRange!.start) &&
              announcement.date
                  .isBefore(dateRange!.end.add(Duration(days: 1))));
      bool isFavorite = !showFavorites ||
          favoriteIndices.contains(announcements.indexOf(announcement));
      return matchesQuery && withinDateRange && isFavorite;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final query = await showSearch<String>(
                context: context,
                delegate: AnnouncementSearchDelegate(),
              );
              if (query != null) {
                setState(() {
                  searchQuery = query;
                });
              }
            },
          ),
          IconButton(
            icon: Icon(showFavorites ? Icons.star : Icons.star_border),
            onPressed: () {
              setState(() {
                showFavorites = !showFavorites;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final selectedDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2025),
                initialDateRange: dateRange,
              );
              if (selectedDateRange != null) {
                setState(() {
                  dateRange = selectedDateRange;
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: filteredAnnouncements.map((announcement) {
              final index = announcements.indexOf(announcement);
              return AnnouncementCard(
                title: announcement.title,
                content: announcement.content,
                date: announcement.date,
                imagePath: announcement.imagePath,
                isFavorite: favoriteIndices.contains(index),
                onFavoriteToggle: () {
                  setState(() {
                    if (favoriteIndices.contains(index)) {
                      favoriteIndices.remove(index);
                    } else {
                      favoriteIndices.add(index);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Announcement {
  final String title;
  final String content;
  final DateTime date;
  final String imagePath;

  Announcement({
    required this.title,
    required this.content,
    required this.date,
    required this.imagePath,
  });
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime date;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  AnnouncementCard({
    required this.title,
    required this.content,
    required this.date,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Date: ${date.toLocal().toShortDateString()}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                    onPressed: onFavoriteToggle,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Date: ${date.toLocal().toShortDateString()}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Click to view',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnnouncementSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

extension DateExtension on DateTime {
  String toShortDateString() {
    return "${this.month}/${this.day}/${this.year}";
  }
}
