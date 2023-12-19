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
              padding: const EdgeInsets.all(KSizes.p12),
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
                        gapH16,
                        ...List.generate(
                          3,
                          (index) => const Column(
                            children: [
                              KSkeleton(
                                height: 16,
                                width: double.infinity,
                              ),
                              gapH4,
                            ],
                          ),
                        ),
                        gapH8,
                        KWrap(
                          children: List.generate(
                            4,
                            (index) => const KSkeleton(
                              height: 23,
                              width: 62.6,
                            ),
                          ),
                        ),
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
