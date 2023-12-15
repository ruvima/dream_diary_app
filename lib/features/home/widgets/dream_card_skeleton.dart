part of '../screens/home_screen.dart';

class _DreamCardSkeleton extends StatelessWidget {
  const _DreamCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _Appbar(),
        SliverList.builder(
          itemCount: 10,
          itemBuilder: (_, i) {
            return Container(
              margin: const EdgeInsets.all(KSizes.p12),
              padding: const EdgeInsets.all(KSizes.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const KSkeleton(
                          height: 20,
                          width: 200,
                        ),
                        gapH12,
                        ...List.generate(
                          3,
                          (index) => const KSkeleton(
                            topPadding: 8,
                            height: 16,
                            width: double.infinity,
                          ),
                        ),
                        gapH16,
                        KWrap(
                          children: List.generate(
                            4,
                            (index) => const KSkeleton(
                              height: 16,
                              width: 60,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  gapW16,
                  const KSkeleton(
                    width: 16,
                    height: 70,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
