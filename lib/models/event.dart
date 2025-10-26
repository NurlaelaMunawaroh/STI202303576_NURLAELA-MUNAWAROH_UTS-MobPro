class Event {
  String title;
  String category;
  String date;
  String time;
  String? description; // opsional: bisa untuk detail tambahan

  Event({
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    this.description,
  });

  // Mengubah Event ke bentuk JSON (Map) agar mudah disimpan
  Map<String, dynamic> toJson() => {
    'title': title,
    'category': category,
    'date': date,
    'time': time,
    'description': description,
  };

  // Mengubah dari JSON (Map) ke bentuk Event lagi
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      description: json['description'],
    );
  }

  // Fungsi bantu untuk format tampilan di list
  @override
  String toString() {
    return '$title - $category ($date $time)';
  }
}
