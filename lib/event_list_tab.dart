import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class EventListTab extends StatelessWidget {
  final List<Event> events;
  const EventListTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return events.isEmpty
        ? Center(child: Text('Belum ada event'))
        : ListView.builder(
            itemCount: events.length,
            itemBuilder: (_, i) {
              final e = events[i];
              return EventCard(
                event: {
                  'title': e.title,
                  'category': e.category,
                  'date': e.date,
                  'time': e.time,
                  'description': e.description,
                },
              );
            },
          );
  }
}
