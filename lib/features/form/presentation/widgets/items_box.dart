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
    return Column(
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
              icon: Icons.edit,
              onPressed: () => Modular.to.pushNamed(
                Routes.selectView,
                arguments: selectType,
              ),
              compact: true,
            ),
          ],
        ),
        UserSelectedList(list: list),
      ],
    );
  }
}
