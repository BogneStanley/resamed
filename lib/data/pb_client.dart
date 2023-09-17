import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/configs/app_configs.dart';
import 'package:pocketbase/pocketbase.dart';

final pbClientProvider = Provider((ref) => PocketBase(AppConfigs.baseUrl));
