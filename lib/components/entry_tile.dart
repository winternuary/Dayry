import 'package:flutter/material.dart';
import '../models/diary_entry.dart';
import '../pages/entry_detail_page.dart';

class EntryTile extends StatelessWidget {
  final DiaryEntry entry;

  const EntryTile({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EntryDetailPage(entry: entry)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Text(entry.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(entry.content, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: Text(entry.date.split('T').first, style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
