part of '../screens/base_screen.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<nav.NavigationBloc, nav.State>(
      builder: (context, state) {
        final model = state.model;
        return _NavigationContainer(
          onChanged: (i) => _onTap(i),
          items: [
            _NavigationItem(
              activeIcon: Icons.home,
              inactiveIcon: Icons.home_outlined,
              label: 'Inicio',
            ),
            _NavigationItem(
              activeIcon: Icons.insert_chart,
              inactiveIcon: Icons.insert_chart_outlined_outlined,
              label: 'Analisis',
            ),
            _NavigationItem(
              activeIcon: Icons.add_circle_outline_sharp,
            ),
            _NavigationItem(
              activeIcon: Icons.find_in_page,
              inactiveIcon: Icons.find_in_page_outlined,
              label: 'Busqueda',
            ),
            _NavigationItem(
              activeIcon: Icons.build,
              inactiveIcon: Icons.build_outlined,
              label: 'Ajustes',
            ),
          ],
          currentIndex: model.currentIndex,
          previousIndex: model.previousIndex,
        );
      },
    );
  }

  void _onTap(int index) {
    if (index == nav.NavigationAction.home.index) {
      print('home');
    } else if (index == nav.NavigationAction.analysis.index) {
      print('analysis');
    } else if (index == nav.NavigationAction.add.index) {
      print('add');
    } else if (index == nav.NavigationAction.search.index) {
      print('search');
    } else if (index == nav.NavigationAction.tools.index) {
      print('tools');
    }
  }
}

class _NavigationContainer extends StatelessWidget {
  const _NavigationContainer({
    required this.items,
    required this.currentIndex,
    required this.previousIndex,
    required this.onChanged,
  });

  final List<_NavigationItem> items;
  final int currentIndex;
  final int previousIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white24,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              items.length,
              (index) {
                final label = items[index].label;
                final activeIcon = items[index].activeIcon;
                final inactiveIcon = items[index].inactiveIcon;

                return Expanded(
                  child: SizedBox(
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        context.read<nav.NavigationBloc>().add(
                              nav.ChangeIndexEvent(currentIndex: index),
                            );
                        onChanged(index);
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              currentIndex == index
                                  ? activeIcon
                                  : inactiveIcon ?? activeIcon,
                              size: label != null ? 27 : 40,
                            ),
                            if (label != null)
                              Text(
                                label,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        AnimatedPositioned(
          left: currentIndex != 2
              ? (width / items.length) * currentIndex
              : (width / items.length) * previousIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            height: 2,
            width: width / items.length,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NavigationItem {
  final String? label;
  final IconData activeIcon;
  final IconData? inactiveIcon;
  _NavigationItem({
    this.label,
    required this.activeIcon,
    this.inactiveIcon,
  });
}
