import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class EventListPage extends StatefulWidget {
  final List<Event> events;

  // ignore: use_super_parameters
  const EventListPage({Key? key, required this.events}) : super(key: key);

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Event")),
      body: widget.events.isEmpty
          ? const Center(
              child: Text(
                "Belum ada event yang ditambahkan",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.events.length,
              itemBuilder: (context, index) {
                final event = widget.events[index];

                // Ubah data Event ke Map agar bisa digunakan di EventCard
                final eventMap = {
                  'title': event.title,
                  'category': event.category,
                  'date': event.date,
                  'time': event.time,
                };

                return EventCard(event: eventMap);
              },
            ),
    );
  }
}
