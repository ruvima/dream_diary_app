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

    return PopScope(
      canPop: false,
      onPopInvoked: (_) => _showAlert(context),
      child: Material(
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
                    onPressed: () => _showAlert(context),
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
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureOr<bool> _showAlert(BuildContext context) async {
    final close = await KShowDialog.alertDialog<bool>(
      context,
      title: UiValues.closeFormTitle,
      content: UiValues.closeFormContent,
      onCancel: () => Navigator.of(context).pop(false),
      textOnCancel: UiValues.cancel,
      onAcept: () {
        Navigator.of(context).pop(true);
      },
      textOnAcept: UiValues.acceptButton,
    );

    if (close ?? false) {
      Modular.to.pop();
    }
    return close ?? false;
  }
}
