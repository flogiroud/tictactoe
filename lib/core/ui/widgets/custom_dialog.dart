import 'package:flutter/material.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/ui/widgets/basic_icon.dart';
import 'package:tictactoe/core/ui/widgets/bordered_text.dart';

abstract class CustomDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    String? titleIcon,
    String? description,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) async => showGeneralDialog<T>(
    barrierColor: Colors.black.withValues(alpha: .7),
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => barrierDismissible ? Navigator.of(context).pop() : null,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: _DialogWrapper(
              title: title,
              titleIcon: titleIcon,
              description: description,
              actions: actions,
            ),
          ),
        ),
      ),
    ),
  );
}

class _DialogWrapper extends StatelessWidget {
  final String? title;
  final String? titleIcon;
  final String? description;
  final List<Widget>? actions;

  const _DialogWrapper({
    required this.title,
    required this.titleIcon,
    required this.description,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: context.appColors.primaryDark,
          borderRadius: BorderRadius.circular(context.appValues.borderRadius),
          border: Border.all(
            color: context.appColors.border,
            width: context.appValues.borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: context.appColors.border.withValues(alpha: .5),
              blurRadius: 0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: titleIcon == null ? 16 : 28,
                      right: 16,
                    ),
                    height: 32,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    color: context.appColors.border,
                    child: FittedBox(
                      child: Text(
                        title!.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  if (titleIcon != null)
                    Positioned(
                      left: -16,
                      top: -8,
                      child: BasicIcon(titleIcon!, size: 40),
                    ),
                ],
              )
            else
              Container(height: 12, color: context.appColors.border),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: BorderedText(
                        text: description!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  if (actions != null)
                    Column(
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: actions!,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
