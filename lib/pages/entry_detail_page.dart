import 'package:flutter/material.dart';
import '../models/diary_entry.dart';

class EntryDetailPage extends StatelessWidget {
  final DiaryEntry entry;

  const EntryDetailPage({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(
              "Date: ${entry.date.split('T').first}",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Divider(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  entry.content,
                  style: const TextStyle(fontSize: 18, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
