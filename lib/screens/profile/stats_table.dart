import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../theme.dart';
import '../../widgets/styled_text.dart';

class StatsTable extends StatefulWidget {
  final Character character;

  const StatsTable(this.character, {super.key});

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star, color: widget.character.points > 0 ? Colors.yellow : Colors.grey),
                const SizedBox(width: 20),
                const StyledText('Stat points available:'),
                const Expanded(child: SizedBox()),
                StyledHeading(widget.character.points.toString())
              ],
            ),
          ),
          // stats table
          Table(
            children: widget.character.statsAsFormattedList
                .map(
                  (stat) => TableRow(
                    decoration: BoxDecoration(color: AppColors.secondaryColor.withOpacity(0.5)),
                    children: [
                      // stat title (e.g. health)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(padding: const EdgeInsets.all(8.0), child: StyledHeading(stat['title']!)),
                      ),
                      // stat value
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(padding: const EdgeInsets.all(8.0), child: StyledHeading(stat['value']!)),
                      ),
                      // icon to increase stat
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(icon: Icon(Icons.arrow_upward, color: AppColors.textColor), onPressed: () => setState(() => widget.character.increaseStat(stat['title']!))),
                      ),
                      // icon to decrease stat
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: GestureDetector(child: Icon(Icons.arrow_downward, color: AppColors.textColor), onTap: () => setState(() => widget.character.decreaseStat(stat['title']!))),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
