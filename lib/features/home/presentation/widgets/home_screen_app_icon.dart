import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/ui/widgets/animations/translate_animation.dart';
import 'package:tictactoe/core/utils/size_utils.dart';

class HomeScreenAppIcon extends StatelessWidget {
  const HomeScreenAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 210,
        height: 228,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TranslateAnimation(
              delay: const Duration(milliseconds: 100),
              curve: Spring.elegant,
              duration: const Duration(milliseconds: 300),
              beginOffset: Offset(-MediaQuery.of(context).size.width, -200),
              child: Image.asset(
                AppImagesAssets.tic,
                width: 200,
                cacheWidth: SizeUtils.getCachedSize(
                  context: context,
                  size: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 76, left: 4),
              child: TranslateAnimation(
                curve: Spring.elegant,
                duration: const Duration(milliseconds: 300),
                delay: const Duration(milliseconds: 300),
                beginOffset: Offset(-MediaQuery.of(context).size.width, 0),
                child: Image.asset(
                  AppImagesAssets.tac,
                  width: 100,
                  cacheWidth: SizeUtils.getCachedSize(
                    context: context,
                    size: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: TranslateAnimation(
                  curve: Spring.elegant,
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 500),
                  beginOffset: Offset(MediaQuery.of(context).size.width, 0),
                  child: Image.asset(
                    AppImagesAssets.toe,
                    width: 100,
                    cacheWidth: SizeUtils.getCachedSize(
                      context: context,
                      size: 100,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
