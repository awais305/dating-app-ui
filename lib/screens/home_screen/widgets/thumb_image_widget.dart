import 'package:dating_app_ui/utils/palette.dart';
import 'package:flutter/material.dart';

class ThumbImageWidget extends StatelessWidget {
  final String url;

  const ThumbImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Palette.primary, width: 2.5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Color(0xFF47c0aa),
            ),
          ),
        )
      ],
    );
  }
}
