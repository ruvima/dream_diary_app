part of '../screens/form_screen.dart';

class _BaseContainer extends StatelessWidget {
  const _BaseContainer({
    required this.child,
    this.topWidget,
  });

  final Widget child;
  final Widget? topWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.background,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(14.0),
        topRight: Radius.circular(14.0),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                KIconButton(
                  compact: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSizes.p8,
                  ),
                  size: 28,
                  icon: Icons.close,
                  onPressed: () {
                    Modular.to.pop();
                  },
                ),
                if (topWidget != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: KSizes.p16),
                      child: topWidget ?? const SizedBox.shrink(),
                    ),
                  )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSizes.p16,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
