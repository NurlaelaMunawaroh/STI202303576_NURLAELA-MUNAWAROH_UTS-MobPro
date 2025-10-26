import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Event"), backgroundColor: Colors.teal),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama acara
                Text(
                  event["title"] ?? "Tanpa Judul",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),

                // Kategori
                Row(
                  children: [
                    Icon(Icons.category, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text(
                      "Kategori: ${event["category"] ?? "-"}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Tanggal
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text(
                      "Tanggal: ${event["date"] ?? "-"}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Waktu
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text(
                      "Waktu: ${event["time"] ?? "-"}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Divider(),

                // Deskripsi tambahan
                Text(
                  "Deskripsi Acara",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal[700],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  event["description"] ??
                      "Tidak ada deskripsi untuk acara ini.",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),

                SizedBox(height: 30),

                // Tombol kembali
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text("Kembali"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
