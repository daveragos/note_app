import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/source/files.dart';
import 'package:note_app/data/source/files_memory_impl.dart';

final filesProvider = Provider<Files>(
  (ref) {
    return FilesMemoryImpl();
  },
);
