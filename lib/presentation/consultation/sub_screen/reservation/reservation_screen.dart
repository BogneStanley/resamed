import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/tools/extensions.dart';

import '../../../common/widgets/field/custom_text_form_field.dart';
import '../../controller/consultation_controller.dart';
import '../../controller/consultation_state.dart';

@RoutePage()
class ReservationScreen extends HookConsumerWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ValueNotifier<int> currentStep = useState(0);
    var t1 = useTextEditingController();
    ConsultationController controller =
        ref.read(consultationControllerProvider.notifier);
    controller.context = context;
    ConsultationState state = ref.watch(consultationControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      var result = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2035),
                      );
                      if (result == null) {
                        return;
                      }
                      var result2 = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (result2 == null) {
                        return;
                      }
                      t1.text = result.toString().split(" ")[0] +
                          " " +
                          result2.format(context);
                    },
                    child: CTextFormField(
                      hintText: "Date de consultation",
                      controller: t1,
                      enabledInput: false,
                      surfixIcon: const Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  5.ph,
                  DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                      searchDelay: Duration(milliseconds: 300),
                    ),
                    items: const [
                      'Type1',
                      'Type2',
                      'Type3',
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        constraints: BoxConstraints(minHeight: 50),
                        hintText: "Type de consultation",
                        filled: true,
                        fillColor: Colors.blue.withOpacity(0.05),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    onChanged: print,
                  ),
                  5.ph,
                  DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                      searchDelay: Duration(milliseconds: 300),
                    ),
                    items: const [
                      'Medecin 1',
                      'Medecin 2',
                      'Medecin 3',
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        constraints: BoxConstraints(minHeight: 50),
                        hintText: "Choisir un medecin",
                        filled: true,
                        fillColor: Colors.blue.withOpacity(0.05),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    onChanged: print,
                  ),
                  5.ph,
                  CTextFormField(
                    hintText: "Motif de consultation",
                  ),
                  5.ph,
                  CTextFormField(
                    hintText: "Lieu de residence",
                  ),
                  5.ph,
                  CTextFormField(
                    hintText: "Numéro de téléphone",
                  )
                ],
              ),
            )),
            10.ph,
            CButton(
              label: "Demandez un rendez vous",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
