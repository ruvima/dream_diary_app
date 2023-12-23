part of '../screens/form_screen.dart';

class _ItemsBox extends StatelessWidget {
  const _ItemsBox({
    required this.title,
    required this.list,
    required this.selectType,
  });
  final String title;
  final List<String> list;
  final SelectType selectType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KTextMedium(
                title,
                fontWeight: FontWeight.w600,
              ),
              KIconButton(
                icon: Icons.add_circle_outlined,
                onPressed: () => Modular.to.pushNamed(
                  Routes.selectView,
                  arguments: selectType,
                ),
              ),
            ],
          ),
          UserSelectedList(
            list: list,
            selectType: selectType,
          ),
        ],
      ),
    );
  }
}
