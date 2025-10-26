import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddEvent;

  const AddEventPage({super.key, required this.onAddEvent});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String _selectedCategory = "Seminar";
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _categories = [
    "Seminar",
    "Ulang Tahun",
    "Kegiatan Kampus",
    "Lainnya",
  ];

  // Memilih tanggal acara
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  // Memilih waktu acara
  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text =
            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  // Simpan data event
  void _saveEvent() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> newEvent = {
        "title": _titleController.text,
        "category": _selectedCategory,
        "date": _selectedDate,
        "time": _selectedTime,
      };

      widget.onAddEvent(newEvent);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Event berhasil disimpan!")));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Event"), backgroundColor: Colors.teal),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Input nama acara
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Nama Acara",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama acara tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Pilih kategori event
                DropdownButtonFormField<String>(
                  initialValue: _selectedCategory,
                  items: _categories
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Pilih tanggal
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Acara",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: _pickDate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pilih tanggal acara";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Pilih waktu
                TextFormField(
                  controller: _timeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Waktu Acara",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  onTap: _pickTime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pilih waktu acara";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),

                // Tombol Simpan
                ElevatedButton.icon(
                  onPressed: _saveEvent,
                  icon: Icon(Icons.save),
                  label: Text("Simpan Event"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 14),
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
