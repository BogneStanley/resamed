import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/tools/extensions.dart';

import '../../controller/exam_controller.dart';
import '../../controller/exam_state.dart';

@RoutePage()
class ExamTab extends HookConsumerWidget {
  const ExamTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ExamController controller = ref.read(examControllerProvider.notifier);
    ExamState state = ref.watch(examControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: const CTextFormField(
            prefixIcon: Icon(Icons.search),
            hintText: "Rechercher",
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 17,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "Envoyer votre ordonance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Card(
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProv,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Numeration formule Sanguine",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        5.ph,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
