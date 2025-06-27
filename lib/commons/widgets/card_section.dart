import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';

class CardSection extends StatelessWidget {
  final Widget? imageCard;
  final void Function() returnBack;
  final void Function()? onShare;
  final bool? isFavorite;
  final void Function()? onFavorite;
  final Widget? bottomDetailCard;
  const CardSection({
    super.key,
    this.imageCard,
    required this.returnBack,
    this.onShare,
    this.isFavorite,
    this.onFavorite,
    this.bottomDetailCard,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 280, width: double.infinity, child: imageCard ?? Placeholder()),
        Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(icon: const Icon(Icons.arrow_back, color: AppsColors.whiteColor), onPressed: returnBack),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: Row(
            children: [IconButton(icon: const Icon(Icons.share, color: AppsColors.whiteColor), onPressed: onShare)],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 24,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: Icon(
                isFavorite ?? false ? Icons.favorite : Icons.favorite_border,
                color: AppsColors.secondaryColor,
              ),
              onPressed: onFavorite,
            ),
          ),
        ),
        Positioned(bottom: 24, left: 24, child: Row(children: [if (bottomDetailCard != null) bottomDetailCard!])),
      ],
    );
  }
}
