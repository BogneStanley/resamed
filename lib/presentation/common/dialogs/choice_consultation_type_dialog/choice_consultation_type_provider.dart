import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/model/consultation_type.dart';
import 'package:pocketbase/pocketbase.dart';

final consultationTypeProvider =
    FutureProvider<List<ConsultationTypeModel>>((ref) async {
  PocketBase pb = ref.read(pbClientProvider);
  List<ConsultationTypeModel> consultationTypes = [];
  final content = await pb
      .collection('consultation_type')
      .getFullList(expand: "medecin_info");

  consultationTypes.addAll(content
      .map(
        (e) => ConsultationTypeModel.fromMap(e.toJson()),
      )
      .toList());
  return consultationTypes;
});
