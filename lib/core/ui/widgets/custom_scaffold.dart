import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/ui/widgets/custom_button.dart';
import 'package:tictactoe/core/ui/widgets/custom_loader.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Function(BuildContext context)? onBack;
  final bool useSafeArea;
  final bool isLoading;

  const CustomScaffold({
    super.key,
    required this.body,
    this.onBack,
    this.useSafeArea = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                stops: const [0, .5],
                colors: [
                  context.appColors.primary,
                  context.appColors.primaryDark,
                ],
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                useSafeArea ? SafeArea(child: body) : body,
                if (onBack != null)
                  Positioned(
                    left: 16,
                    top: MediaQuery.of(context).padding.top + 16,
                    child: CustomButton(
                      onTap: () => onBack!(context),
                      size: CustomButtonSize.small,
                      color: context.appColors.red,
                      icon: AppImagesAssets.cross,
                    ),
                  ),
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: context.appColors.disabled.withValues(alpha: .5),
                child: const CustomLoader(),
              ),
            ),
        ],
      ),
    );
  }
}
