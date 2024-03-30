import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core.dart';

class KButtonMultipleOp extends StatefulWidget {
  final List<String> ranges;
  final Function(int) onChanged;

  const KButtonMultipleOp({
    Key? key,
    required this.ranges,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<KButtonMultipleOp> createState() => _KButtonMultipleOpState();
}

class _KButtonMultipleOpState extends State<KButtonMultipleOp> {
  final _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final rowWidth = constraints.maxWidth;

        return KCard(
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 2,
                bottom: 2,
                left: (rowWidth / widget.ranges.length) *
                    _selectedIndexNotifier.value,
                width: rowWidth / widget.ranges.length,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Container(
                  width: width / widget.ranges.length,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  widget.ranges.length,
                  (i) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            await HapticFeedback.heavyImpact();
                            _selectedIndexNotifier.value = i;
                            widget.onChanged(i);
                            setState(() {});
                          },
                          child: KTextLarge(
                            widget.ranges[i],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
