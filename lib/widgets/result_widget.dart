import 'package:flutter/material.dart';

import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/info/result_data.dart';
import 'package:mcare_calculator/models/result_model.dart';

class ResultWidget extends StatefulWidget {
  final Result? result;

  const ResultWidget({this.result, super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  Map? rMap = results.profitResults;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 50,
      ),
      crossAxisCount: 5,
      crossAxisSpacing: 30,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      physics: const BouncingScrollPhysics(),
      children: rMap!.entries
          .map(
            (MapEntry valueInfo) => Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    valueInfo.value['color'].withOpacity(0.4),
                    valueInfo.value['color'],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueInfo.value['longText'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColorPallet.backgroundLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '\$ ${valueInfo.value['value']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColorPallet.backgroundLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
