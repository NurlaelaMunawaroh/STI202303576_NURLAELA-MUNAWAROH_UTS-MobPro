// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/event.dart';

class AddEventTab extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddEvent;

  const AddEventTab({super.key, required this.onAddEvent});

  @override
  State<AddEventTab> createState() => _AddEventTabState();
}

class _AddEventTabState extends State<AddEventTab> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String _selectedCategory = "Seminar";
  // ignore: unused_field
  DateTime? _selectedDate;
  // ignore: unused_field
  TimeOfDay? _selectedTime;

  final List<String> _categories = [
    "Seminar",
    "Ulang Tahun",
    "Kegiatan Kampus",
    "Lainnya",
  ];

  // Fungsi untuk memilih tanggal
  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
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

  // Fungsi untuk memilih waktu
  Future<void> _pickTime() async {
    final pickedTime = await showTimePicker(
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

  // Fungsi untuk menyimpan event
  void _saveEvent() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> newEvent = {
        "title": _titleController.text,
        "category": _selectedCategory,
        "date": _dateController.text,
        "time": _timeController.text,
      };

      widget.onAddEvent(newEvent);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Event berhasil ditambahkan!")));

      // Reset form
      _titleController.clear();
      _dateController.clear();
      _timeController.clear();
      setState(() {
        _selectedCategory = "Seminar";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                value: _selectedCategory,
                items: _categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                decoration: InputDecoration(
                  labelText: "Kategori Event",
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

              // Tombol simpan
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
    );
  }
}
