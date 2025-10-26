import 'package:flutter/material.dart';
import '../../pages/event_detail_page.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman detail event
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(event: event),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon kategori
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.teal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getCategoryIcon(event["category"]),
                  color: Colors.teal,
                  size: 28,
                ),
              ),
              SizedBox(width: 12),

              // Detail teks event
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul acara
                    Text(
                      event["title"] ?? "Tanpa Judul",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                    SizedBox(height: 6),

                    // Kategori event
                    Text(
                      "Kategori: ${event["category"] ?? "-"}",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),

                    // Tanggal & waktu
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey[700],
                        ),
                        SizedBox(width: 4),
                        Text(
                          event["date"] ?? "-",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[700],
                        ),
                        SizedBox(width: 4),
                        Text(
                          event["time"] ?? "-",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Panah detail
              Icon(Icons.chevron_right, color: Colors.teal, size: 28),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi menentukan ikon berdasarkan kategori event
  IconData _getCategoryIcon(String? category) {
    switch (category) {
      case "Seminar":
        return Icons.school;
      case "Ulang Tahun":
        return Icons.cake;
      case "Kegiatan Kampus":
        return Icons.group;
      default:
        return Icons.event;
    }
  }
}
