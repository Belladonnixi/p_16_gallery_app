import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/gen/assets.gen.dart';
import 'package:p_16_gallery_app/presentation/widgets/star_avatar.dart';

class EmptyFavoritesContent extends StatelessWidget {
  const EmptyFavoritesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 64,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Du hast leider noch keine Favoriten...',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          StarAvatar(imagePath: Assets.images.sadHamster.path, size: 200),
        ],
      ),
    );
  }
}
