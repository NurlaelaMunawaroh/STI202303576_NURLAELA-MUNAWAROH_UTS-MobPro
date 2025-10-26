import 'package:flutter/material.dart';
// ignore: unused_import
import '../../models/event.dart'; // Jika tidak digunakan lagi, bisa dihapus
import '../../widgets/event_card.dart';

class EventListPage extends StatefulWidget {
  final List<Map<String, dynamic>>
  events; // Ubah ke List<Map<String, dynamic>> agar cocok dengan HomePage

  const EventListPage({super.key, required this.events});

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

                // Langsung gunakan event (sudah Map), tanpa konversi
                return EventCard(event: event);
              },
            ),
    );
  }
}
