import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/models/result_model.dart';

Result results = Result(
  profitResults: {
    'f_profit': {
      'longText': 'Frame Profit*:',
      'value': 0.00,
      'color': AppColorPallet.red,
    },
    'p_pays': {
      'longText': 'Patient Pays:',
      'value': 0.00,
      'color': AppColorPallet.orange,
    },
    'i_pays': {
      'longText': 'Insurance Pays:',
      'value': 0.00,
      'color': AppColorPallet.green,
    },
    't_rec': {
      'longText': 'Total Recieved:',
      'value': 0.00,
      'color': AppColorPallet.blue,
    },
    'f_cost': {
      'longText': 'Frame Cost:',
      'value': 0.00,
      'color': AppColorPallet.violet,
    },
  },
);
