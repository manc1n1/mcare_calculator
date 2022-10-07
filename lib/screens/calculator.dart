import 'package:flutter/material.dart';

import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/models/coverage_model.dart';
import 'package:mcare_calculator/screens/home.dart';
import 'package:mcare_calculator/widgets/result_widget.dart';

class CalculatorScreen extends StatefulWidget {
  final Coverage coverage;

  const CalculatorScreen(this.coverage, {super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? subcoverage;

  @override
  void initState() {
    if (widget.coverage.subtype.length == 1) {
      subcoverage = widget.coverage.subtype.keys.first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? subMap = widget.coverage.subtype[subcoverage];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorPallet.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorPallet.backgroundLight,
          ),
          onPressed: () => Navigator.of(context).pop(), // TODO: reinit coverage
        ),
      ),
      backgroundColor: AppColorPallet.backgroundDark,
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            // subMap?.entries.map(
            //   (MapEntry valueInfo) => valueInfo.value['value'] = null,
            // );
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: Material(
            color: AppColorPallet.backgroundDark,
            child: Column(
              children: [
                // Row(),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 50,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColorPallet.backgroundLight,
                      border: Border.all(
                        color: AppColorPallet.backgroundLight,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: AppColorPallet.black,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: DropdownButton(
                        items: widget.coverage.subtype.keys
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.toString(),
                                ),
                              ),
                            )
                            .toList(),
                        hint: const Text('Select Subtype'),
                        // isExpanded: true,
                        value: subcoverage,
                        onChanged: (value) {
                          setState(() {
                            subcoverage = value.toString();
                          });
                        },
                        style: const TextStyle(
                          color: AppColorPallet.backgroundDark,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                        ),
                        iconEnabledColor: AppColorPallet.backgroundDark,
                        underline: Container(),
                        dropdownColor: AppColorPallet.backgroundLight,
                      ),
                    ),
                  ),
                ),
                if (subMap != null)
                  Expanded(
                    child: Center(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 50,
                        ),
                        crossAxisCount: 7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        physics: const BouncingScrollPhysics(),
                        children:
                            // coverages.map((coverage) => Text(coverage.type)).toList(),
                            subMap.entries
                                .map(
                                  (MapEntry valueInfo) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: LinearGradient(
                                        colors: [
                                          valueInfo.value['color']
                                              .withOpacity(0.4),
                                          valueInfo.value['color'],
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueInfo.value['longText'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color:
                                                AppColorPallet.backgroundLight,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: AppColorPallet.black,
                                            fontSize: 20,
                                          ),
                                          cursorColor: valueInfo.value['color'],
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor:
                                                AppColorPallet.backgroundLight,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              borderSide: const BorderSide(
                                                color: AppColorPallet.black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              borderSide: BorderSide(
                                                color: valueInfo.value['color'],
                                              ),
                                            ),
                                          ),
                                          controller: TextEditingController(
                                            text: valueInfo.value['value'],
                                          ),
                                          onChanged: (String value) {
                                            double? newValue =
                                                double.tryParse(value);
                                            if (newValue == null) {
                                              valueInfo.value['value'] =
                                                  newValue;
                                            } else {
                                              valueInfo.value['value'] =
                                                  newValue;
                                            }
                                          },
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                double.tryParse(value) ==
                                                    null) {
                                              return "Not a number";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                if (subMap != null)
                  const Expanded(
                    child: Center(
                      // child: Text(
                      //   'HERE',
                      //   style: TextStyle(
                      //     fontSize: 40,
                      //     fontWeight: FontWeight.bold,
                      //     color: AppColorPallet.backgroundLight,
                      //   ),
                      // ),
                      child: ResultWidget(),
                    ),
                  ),
                if (subMap != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          top: 25,
                          right: 50,
                          bottom: 25,
                        ),
                        child: const Text(
                          '*Does not include additional ECP earned fees for patient exam, copays, and dispensing fees.',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColorPallet.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(
                          top: 25,
                          right: 50,
                          bottom: 25,
                        ),
                        child: SizedBox(
                          height: 75,
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              splashFactory: InkRipple.splashFactory,
                              backgroundColor: AppColorPallet.green,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            onPressed: () {
                              // FocusScopeNode currentFocus =
                              //     FocusScope.of(context);

                              // if (!currentFocus.hasPrimaryFocus) {
                              //   currentFocus.unfocus();
                              // }
                              Map<String, dynamic> map = {};
                              for (MapEntry<String,
                                      Map<String, dynamic>> element
                                  in widget
                                      .coverage.subtype[subcoverage].entries) {
                                map[element.key] = element.value['value'];
                              }
                              widget.coverage.algorithm[subcoverage](map);
// TODO:
                              // print(map);

                              // print(
                              //   widget.coverage.algorithm[subcoverage](map),
                              // );
                              // setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: const [
                                  Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColorPallet.backgroundLight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColorPallet.backgroundLight,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
