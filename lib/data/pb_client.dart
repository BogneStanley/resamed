import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final pbClientProvider =
    Provider((ref) => PocketBase("https://resamed.big3tech.com"));
