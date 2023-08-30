import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/home/widgets/home_post_card.dart';

class HomePostsView extends HookConsumerWidget {
  const HomePostsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 15,
      ),
      child: Column(
        children: [
          HomePostCard(),
          HomePostCard(),
          HomePostCard(),
          HomePostCard(),
        ],
      ),
    );
  }
}
