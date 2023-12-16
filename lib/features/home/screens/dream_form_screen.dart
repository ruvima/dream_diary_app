import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../../../core/widgets/k_modal_container.dart';
import '../domain/domain.dart';

class DreamFormScreen extends StatelessWidget {
  const DreamFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KModalContainer(
      topWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _Date(),
          const Spacer(),
          KPrimaryButton(
            isSmall: true,
            onPressed: () {},
            height: 30,
            text: 'Guardar',
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KTextMedium(
            'Titulo: ',
            fontWeight: FontWeight.w600,
          ),
          gapH4,
          const KTextFormField(hint: 'Dale un titulo a tu sueño'),
          gapH12,
          const KTextMedium(
            'Desripción: ',
            fontWeight: FontWeight.w600,
          ),
          gapH4,
          const KTextFormField(
            hint: 'Describe tu sueño',
            maxLines: 8,
          ),
          gapH12,
          const KTextMedium(
            'Tipo de sueño:',
            fontWeight: FontWeight.w600,
          ),
          gapH4,
          SizedBox(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: DreamType.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: KSizes.p12),
                      child: KFilterChip(
                        label: e.dreamTypeName,
                        onSelected: (value) {},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          gapH4,
          const KTextMedium(
            'Claridad: ',
            fontWeight: FontWeight.w600,
          ),
          const _Clarity(),
          const _ElementBox(
            title: 'Emocion:',
            list: ['Feliz', 'Emocionado', 'Triste'],
            selectType: SelectType.emotion,
          ),
          gapH4,
          const _ElementBox(
            title: 'Pesonas en el sueño:',
            list: ['Rodolfo', 'Reno', 'Sherk'],
            selectType: SelectType.people,
          ),
          gapH4,
          const _ElementBox(
            title: 'Tags:',
            list: ['Pelicula', 'Pixar', 'Vaca'],
            selectType: SelectType.tags,
          ),
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {
  const _Date();

  @override
  Widget build(BuildContext context) {
    return KInkwell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(KSizes.p4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.calendar_month,
            ),
            gapW4,
            KTextLarge(
              '12/05/17',
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class _Clarity extends StatelessWidget {
  const _Clarity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KSlider(
            value: 0.5,
            onChanged: (clarity) {},
          ),
        ),
        const KTextMedium(
          '50%',
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

class _ElementBox extends StatelessWidget {
  const _ElementBox({
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
              onPressed: () => Modular.to.push(
                CupertinoPageRoute(
                  builder: (_) => _SelectView(selectType: selectType),
                ),
              ),
              compact: true,
            ),
          ],
        ),
        KWrap(
          alignment: WrapAlignment.start,
          children: list
              .map(
                (i) => KFilterChip(
                  label: i,
                  onSelected: (value) {},
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SelectView extends StatelessWidget {
  const _SelectView({required this.selectType});
  final SelectType selectType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: const SizedBox(
              width: 200,
              height: 35,
              child: KTextFormField(
                hint: 'Put your tag',
                contentPadding: EdgeInsets.all(KSizes.p8),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  height: 30,
                  child: KPrimaryButton(
                    text: 'Usar',
                    isSmall: true,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum SelectType {
  emotion,
  people,
  tags,
}
