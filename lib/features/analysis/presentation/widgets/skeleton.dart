part of '../screens/analysis_screen.dart';

class _AnalisysSkeleton extends StatelessWidget {
  const _AnalisysSkeleton();

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Modular.get<prefs_bloc.PreferencesBloc>().state.model.isDarkMode;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: KSizes.p12,
          vertical: KSizes.p12,
        ),
        child: Opacity(
          opacity: isDarkMode ? 0.2 : 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH48,
              const KSkeleton(
                height: 225,
                width: double.infinity,
              ),
              gapH12,
              const KSkeleton(
                height: 250,
                width: double.infinity,
              ),
              gapH12,
              ...List.generate(
                3,
                (index) => const Column(
                  children: [
                    KSkeleton(
                      height: 225,
                      width: double.infinity,
                    ),
                    gapH12,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
