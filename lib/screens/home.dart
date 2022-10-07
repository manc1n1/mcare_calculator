import 'package:flutter/material.dart';

import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/info/coverage_data.dart';
import 'package:mcare_calculator/models/coverage_model.dart';
import 'package:mcare_calculator/screens/calculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void selectCoverage(BuildContext ctx, Coverage coverage) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return CalculatorScreen(coverage);
      },
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPallet.backgroundDark,
      body: SafeArea(
        child: Material(
          color: AppColorPallet.backgroundDark,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 100,
                ),
                child: Text(
                  'Select Coverage Type',
                  style: TextStyle(
                    color: AppColorPallet.backgroundLight,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 100,
                  ),
                  crossAxisCount: 4,
                  crossAxisSpacing: 25,
                  // mainAxisSpacing: 25,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:
                      // coverages.map((coverage) => Text(coverage.type)).toList(),
                      coverages
                          .map(
                            (coverage) => InkWell(
                              onTap: () => selectCoverage(context, coverage),
                              splashFactory: InkRipple.splashFactory,
                              splashColor: AppColorPallet.white,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                // padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      coverage.color.withOpacity(0.4),
                                      coverage.color,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    coverage.type,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: AppColorPallet.backgroundLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
