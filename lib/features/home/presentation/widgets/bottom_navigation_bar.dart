part of '../screens/base_screen.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<preferences_bloc.PreferencesBloc,
        preferences_bloc.State>(
      buildWhen: (_, state) => state is preferences_bloc.LanguageChangeState,
      bloc: Modular.get<preferences_bloc.PreferencesBloc>(),
      builder: (context, state) {
        return BlocBuilder<nav.NavigationBloc, nav.State>(
          buildWhen: (_, state) => state is nav.NavigationState,
          builder: (context, state) {
            final model = state.model;
            return _NavigationContainer(
              onChanged: (i) => _onTap(i, model.currentIndex),
              items: [
                _NavigationItem(
                  activeIcon: Icons.home,
                  inactiveIcon: Icons.home_outlined,
                  label: UiValues.homeLabel,
                ),
                _NavigationItem(
                  activeIcon: Icons.insert_chart,
                  inactiveIcon: Icons.insert_chart_outlined_outlined,
                  label: UiValues.analysisLabel,
                ),
                _NavigationItem(
                  activeIcon: Icons.add_circle_outline_outlined,
                ),
                _NavigationItem(
                  activeIcon: Icons.find_in_page,
                  inactiveIcon: Icons.find_in_page_outlined,
                  label: UiValues.searchLabel,
                ),
                _NavigationItem(
                  activeIcon: Icons.tune,
                  inactiveIcon: Icons.tune_outlined,
                  label: UiValues.settingsLabel,
                ),
              ],
              currentIndex: model.currentIndex,
              previousIndex: model.previousIndex,
            );
          },
        );
      },
    );
  }

  void _onTap(int nextIndex, int currentIndex) {
    final Map<int, String> routes = {
      nav.NavigationAction.home.index: Routes.home,
      nav.NavigationAction.analysis.index: Routes.analysis,
      nav.NavigationAction.form.index: Routes.form,
      nav.NavigationAction.search.index: Routes.search,
      nav.NavigationAction.setting.index: Routes.setting,
    };

    final String? nextRoute = routes[nextIndex];

    if (nextRoute != null &&
        nextIndex != currentIndex &&
        nextRoute != Routes.form) {
      Modular.to.navigate(nextRoute);
    } else if (nextRoute == Routes.form) {
      // final Map<FormArgs, dynamic> args = {
      //   FormArgs.dreamEntity: null,
      //   FormArgs.formType: FormType.edit,
      // };
      Modular.to.pushNamed(
        nextRoute!,
        arguments: FormArgs(formType: FormType.create),
      );
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
    final color = Theme.of(context).colorScheme;
    return Material(
      color: color.background,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: color.surface,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                items.length,
                (index) {
                  final navItem = items[index];

                  final bool isActive =
                      currentIndex != nav.NavigationAction.form.index
                          ? index == currentIndex
                          : previousIndex == index &&
                              index != nav.NavigationAction.form.index;

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
                          child: _NavIcon(
                            navItem: navItem,
                            isActive: isActive,
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
              decoration: BoxDecoration(
                color: color.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.navItem,
    required this.isActive,
  });

  final _NavigationItem navItem;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: isActive ? 1 : 0.6,
          child: KIcon(
            icon: isActive
                ? navItem.activeIcon
                : navItem.inactiveIcon ?? navItem.activeIcon,
            size: navItem.label != null ? 27 : 40,
            color: isActive
                ? colors.primary
                : colors.onBackground.withOpacity(
                    0.7,
                  ),
          ),
        ),
        if (navItem.label != null)
          KTextSmall(
            navItem.label ?? '',
            color: isActive
                ? colors.primary
                : colors.onBackground.withOpacity(
                    0.7,
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
