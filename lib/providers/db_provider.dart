import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/diary_entry.dart';
import '../services/db_service.dart';

final dbServiceProvider = Provider((ref) => DBService());

final diaryProvider = StateNotifierProvider<DiaryNotifier, List<DiaryEntry>>((ref) {
  final dbService = ref.read(dbServiceProvider);
  return DiaryNotifier(dbService);
});

class DiaryNotifier extends StateNotifier<List<DiaryEntry>> {
  final DBService dbService;

  DiaryNotifier(this.dbService) : super([]) {
    _addExampleEntry();
    loadEntries();
  }

  // 예시 데이터 추가
  void _addExampleEntry() {
    final exampleEntry = DiaryEntry(
      id: 0,
      title: "나의 첫번째 일기",
      content: "나 진짜 오늘 개 힘들었어",
      date: DateTime.now().toIso8601String(),
    );
    state = [exampleEntry];
  }

  Future<void> loadEntries() async {
    final entries = await dbService.getEntries();
    state = [...state, ...entries]; // 기존 상태에 DB 데이터를 추가
  }

  Future<void> addEntry(DiaryEntry entry) async {
    await dbService.insertEntry(entry);
    state = [...state, entry]; // 상태를 즉시 갱신
  }
}
