import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

import '../../../../core/core.dart';
import '../../../../core/shared/bloc/preferences/preferences_bloc.dart'
    as prefs_bloc;
import '../blocs/list/bloc.dart' as analysis_bloc;
import '../blocs/time_range/bloc.dart' as time_range;

part '../widgets/bar_chart.dart';
part '../widgets/details.dart';
part '../widgets/heatmap.dart';
part '../widgets/pie_chart.dart';
part '../widgets/skeleton.dart';
part '../widgets/time_selector.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => time_range.TimeRangeBloc()
            ..add(
              time_range.ChangeTimeRangeEvent(
                timeRange: TimeRange.thirtyDays,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => analysis_bloc.AnalysisDreamBloc(
            rangeBloc: context.read<time_range.TimeRangeBloc>(),
          ),
        ),
      ],
      child: const _AnalysisView(),
    );
  }
}

class _AnalysisView extends StatelessWidget {
  const _AnalysisView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<analysis_bloc.AnalysisDreamBloc, analysis_bloc.State>(
      builder: (_, state) {
        final model = state.model;

        if (state is analysis_bloc.ErrorState) {
          return ErrorBody(message: state.model.error);
        }
        if (state is analysis_bloc.DreamsLoaded) {
          final dateModel = state.model.getDates();
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const _Appbar(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
                sliver: SliverList.list(
                  children: [
                    gapH12,
                    const _TimeSelector(),
                    gapH12,
                    _Details(
                      totalDreams: state.model.dreams.length,
                      totalWords: model.countWords(),
                    ),
                    gapH12,
                    _HeatMap(
                      dates: dateModel.datesMap,
                      startDate: dateModel.oldestDate,
                    ),
                    gapH12,
                    _PieChart(model.getDreamTypes()),
                    gapH12,
                    _BarChart(
                      ordinalData: model.getData(
                        type: SelectType.emotion,
                      ),
                      title: UiValues.yourEmotionsLabel,
                    ),
                    gapH12,
                    _BarChart(
                      ordinalData: model.getData(
                        type: SelectType.people,
                      ),
                      title: UiValues.peopleInDreamLabel,
                    ),
                    gapH12,
                    _BarChart(
                      ordinalData: model.getData(
                        type: SelectType.places,
                      ),
                      title: UiValues.placesLabel,
                    ),
                    gapH12,
                    _BarChart(
                      ordinalData: model.getData(
                        type: SelectType.tags,
                      ),
                      title: UiValues.tagsLabel,
                    ),
                    gapH12,
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(
          child: _AnalisysSkeleton(),
        );
      },
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      pinned: true,
      toolbarHeight: 40,
      backgroundColor: Theme.of(context).colorScheme.background,
      expandedHeight: 60,
      centerTitle: true,
      collapsedHeight: 45,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isExpanded = constraints.biggest.height >= 70;
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
            title: KHeadline5(UiValues.analysisLabel),
            centerTitle: !isExpanded,
          );
        },
      ),
    );
  }
}
