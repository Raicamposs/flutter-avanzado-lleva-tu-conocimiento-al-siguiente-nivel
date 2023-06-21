import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../models/band.dart';

const List<Color> colorList = [
  Color(0xFFE3F2FD),
  Color(0xFF90CAF9),
  Color(0xFFE3F2FD),
  Color(0xFFF48FB1),
  Color(0xFFFFFDE7),
  Color(0xFFFFF59D),
];

class Graph extends StatelessWidget {
  final List<Band> bands;

  const Graph({
    super.key,
    required this.bands,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {};

    for (var band in bands) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    }

    return LayoutBuilder(builder: (context, builder) {
      final size = MediaQuery.sizeOf(context);

      final isSmall = size.width < 350;

      return Container(
        padding: const EdgeInsets.all(8),
        height: size.height * 0.4,
        constraints: const BoxConstraints(maxHeight: 400, minHeight: 100),
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          colorList: colorList,
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            chartValueBackgroundColor: Colors.grey[200]!,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          legendOptions: LegendOptions(
            legendPosition:
                isSmall ? LegendPosition.bottom : LegendPosition.right,
            showLegends: true,
          ),
          chartType: ChartType.ring,
        ),
      );
    });
  }
}
