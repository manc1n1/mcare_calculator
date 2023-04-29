import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/models/coverage_model.dart';

class CalculatorScreen extends StatefulWidget {
  final Coverage coverage;

  const CalculatorScreen(this.coverage, {super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? subcoverage;
  bool _isVisible = true;

  @override
  void initState() {
    if (widget.coverage.subtype.length == 1) {
      subcoverage = widget.coverage.subtype.keys.first;
      for (MapEntry<String, Map<String, dynamic>> element
          in widget.coverage.subtype[subcoverage].entries) {
        widget.coverage.subtype[subcoverage][element.key]['value'] = null;
      }
      for (MapEntry valueInfo in widget.coverage.profit.entries) {
        valueInfo.value['value'] = 0.00;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? subMap = widget.coverage.subtype[subcoverage];
    Map? rMap = widget.coverage.profit;

    // TODO: reactive screen size

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.coverage.type.toUpperCase(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColorPallet.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorPallet.backgroundLight,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColorPallet.backgroundDark,
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            Navigator.of(context).pop();
          }
        },
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Material(
            color: AppColorPallet.backgroundDark,
            child: Column(
              children: [
                // Row(),
                if (widget.coverage.subtype.length > 1)
                  Visibility(
                    visible: !_isVisible,
                    child: Container(
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
                                for (MapEntry<String,
                                        Map<String, dynamic>> element
                                    in widget.coverage.subtype[subcoverage]
                                        .entries) {
                                  widget.coverage.subtype[subcoverage]
                                      [element.key]['value'] = null;
                                }
                                for (MapEntry valueInfo
                                    in widget.coverage.profit.entries) {
                                  valueInfo.value['value'] = 0.00;
                                }
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
                  ),
                if (widget.coverage.subtype.length > 1)
                  Visibility(
                    visible: _isVisible,
                    child: Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(
                          vertical: 100,
                          horizontal: 100,
                        ),
                        crossAxisCount: widget.coverage.subtype.length,
                        crossAxisSpacing: 100,
                        // mainAxisSpacing: 25,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: widget.coverage.subtype.keys
                            .map(
                              (coverage) => InkWell(
                                onTap: () => {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                    subcoverage = coverage.toString();
                                    for (MapEntry<String,
                                            Map<String, dynamic>> element
                                        in widget.coverage.subtype[subcoverage]
                                            .entries) {
                                      widget.coverage.subtype[subcoverage]
                                          [element.key]['value'] = null;
                                    }
                                    for (MapEntry valueInfo
                                        in widget.coverage.profit.entries) {
                                      valueInfo.value['value'] = 0.00;
                                    }
                                  })
                                },
                                splashFactory: InkRipple.splashFactory,
                                splashColor: AppColorPallet.white,
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  // padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        widget.coverage.color.withOpacity(0.4),
                                        widget.coverage.color,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      coverage.toString(),
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
                  ),
                if (subMap != null)
                  Expanded(
                    child: Center(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 50,
                        ),
                        // TODO: widget.length
                        crossAxisCount: 7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        physics: const BouncingScrollPhysics(),
                        children: subMap.entries
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
                                      valueInfo.value['color'].withOpacity(0.4),
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
                                        color: AppColorPallet.backgroundLight,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9.,]'))
                                      ],
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
                                          valueInfo.value['value'] = newValue;
                                        } else {
                                          valueInfo.value['value'] = newValue;
                                        }
                                      },
                                      validator: (String? value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            double.tryParse(value) == null) {
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
                              Map<String, dynamic> map = {};
                              for (MapEntry<String,
                                      Map<String, dynamic>> element
                                  in widget
                                      .coverage.subtype[subcoverage].entries) {
                                if (element.value['value'] == null) {
                                  element.value['value'] = 0.00;
                                } else if (element.value['value'] == '0.0') {
                                  element.value['value'] = 0.00;
                                } else if (element.value['value'] ==
                                    element.value['value'].toString()) {
                                  element.value['value'] =
                                      double.tryParse(element.value['value']);
                                }
                                map[element.key] = element.value['value'];
                              }

                              Map pMap =
                                  widget.coverage.algorithm[subcoverage](map);
                              for (MapEntry valueInfo in rMap.entries) {
                                valueInfo.value['value'] = pMap[valueInfo.key];
                              }

                              setState(() {
                                for (MapEntry<String,
                                        Map<String, dynamic>> element
                                    in widget.coverage.subtype[subcoverage]
                                        .entries) {
                                  widget.coverage.subtype[subcoverage]
                                          [element.key]['value'] =
                                      element.value['value'].toStringAsFixed(2);
                                }
                              });
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
                if (subMap != null)
                  Expanded(
                    child: Center(
                      child: GridView.count(
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
                        children: rMap.entries
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      '\$ ${valueInfo.value['value'].toStringAsFixed(2)}',
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
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
