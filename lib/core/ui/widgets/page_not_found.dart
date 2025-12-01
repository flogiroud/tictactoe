import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/l10n/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/ui/widgets/custom_button.dart';
import 'package:tictactoe/core/ui/widgets/custom_scaffold.dart';

class PageNotFound extends StatelessWidget {
  final String path;

  const PageNotFound({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '404',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      TextSpan(
                        text: ' ${AppLocalizations.of(context).pageNotFound}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                path,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              CustomButton(
                onTap: () => context.go(Routes.home),
                text: AppLocalizations.of(context).goToHome,
                color: context.appColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
