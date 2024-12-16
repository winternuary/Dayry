import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/diary_entry.dart';
import '../providers/db_provider.dart';

class AddEntryPage extends ConsumerWidget {
  const AddEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("오늘 하루를 돌아보기")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "일기 제목",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "일기 내용",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final entry = DiaryEntry(
                    title: titleController.text,
                    content: contentController.text,
                    date: DateTime.now().toIso8601String(),
                  );
                  ref.read(diaryProvider.notifier).addEntry(entry);
                  Navigator.pop(context);
                },
                child: const Text("저장하기"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
