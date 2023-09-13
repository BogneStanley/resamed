import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:pocketbase/pocketbase.dart';

final checkAuthProvider = StreamProvider<AuthStoreEvent>((ref) async* {
  var pb = ref.read(pbClientProvider);
  yield AuthStoreEvent(pb.authStore.token, pb.authStore.model);
  yield* pb.authStore.onChange;
});
