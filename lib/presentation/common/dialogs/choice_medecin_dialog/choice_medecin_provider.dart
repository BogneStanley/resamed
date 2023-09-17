import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/model/medecin.dart';
import 'package:pocketbase/pocketbase.dart';

final medecinProvider = FutureProvider<List<MedecinModel>>((ref) async {
  PocketBase pb = ref.read(pbClientProvider);
  List<MedecinModel> medecins = [];
  final content =
      await pb.collection('medecin').getFullList(expand: "medecin_info");

  medecins.addAll(content
      .map(
        (e) => MedecinModel.fromMap(e.toJson()
          ..["avatar"] = pb.files.getUrl(e, e.getStringValue("avatar"))),
      )
      .toList());
  medecins.removeWhere((element) => element.id == pb.authStore.model.id);
  return medecins;
});
