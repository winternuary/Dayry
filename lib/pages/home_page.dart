import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/db_provider.dart';
import '../components/entry_tile.dart';
import 'add_entry_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(diaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dayry"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) => EntryTile(entry: entries[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEntryPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
