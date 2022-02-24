import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error),
              const SizedBox(height: 16),
              Text(
                'Page not found',
                style: theme.textTheme.headline6,
              ),
              const SizedBox(height: 16),
              Text(
                "The page you are looking for does't seems to exist.",
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  elevation: 0,
                  shape: const StadiumBorder(),
                ),
                onPressed: context.pop,
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
