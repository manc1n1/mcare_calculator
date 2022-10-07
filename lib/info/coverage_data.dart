import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/models/coverage_model.dart';
import 'package:mcare_calculator/info/algorithms.dart';

List<Coverage> coverages = [
  Coverage(
    type: 'VSP',
    algorithm: {
      'None': vsp,
    },
    subtype: {
      'None': {
        'wac': {
          'longText': 'Wholesale Acquisition Cost (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'r_price': {
          'longText': 'Retail Price (\$)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        'r_allow': {
          'longText': 'Retail Allowance (\$)',
          'value': null,
          'color': AppColorPallet.green,
        },
        'w_allow': {
          'longText': 'Wholesale Allowance (\$)',
          'value': null,
          'color': AppColorPallet.blue,
        },
        'add_fp': {
          'longText': 'Additional Frame Payment (\$)',
          'value': null,
          'color': AppColorPallet.violet,
        },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.orange,
        },
      },
    },
    color: AppColorPallet.red,
  ),
  Coverage(
    type: 'EyeMed',
    algorithm: {
      'None': eyeMed,
    },
    subtype: {
      'None': {
        'wac': {
          'longText': 'Wholesale Acquisition Cost (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'r_price': {
          'longText': 'Retail Price (\$)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        'r_allow': {
          'longText': 'Retail Allowance (\$)',
          'value': null,
          'color': AppColorPallet.green,
        },
        // 'w_allow': {
        //   'longText': 'Wholesale Allowance (\$)',
        //   'value': null,
        // },
        'f_factor': {
          'longText': 'Frame Factor (#)',
          'value': null,
          'color': AppColorPallet.blue,
        },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.violet,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.red,
        },
      },
    },
    color: AppColorPallet.orange,
  ),
  Coverage(
    type: 'Davis',
    algorithm: {
      'Non Covered': davisNonCovered,
      'Covered': davisCovered,
    },
    subtype: {
      'Non Covered': {
        'wac': {
          'longText': 'Wholesale Acquisition Cost (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'r_price': {
          'longText': 'Retail Price (\$)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        'r_allow': {
          'longText': 'Retail Allowance (\$)',
          'value': null,
          'color': AppColorPallet.green,
        },
        'pf_payment': {
          'longText': 'Provider Frame Payment (\$)',
          'value': null,
          'color': AppColorPallet.blue,
        },
        // 'add_fp': {
        //   'longText': 'Additional Frame Payment (\$)',
        //   'value': null,
        // },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.violet,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.red,
        },
      },
      'Covered': {
        // 'wac': {
        //   'longText': 'Wholesale Acquisition Cost (\$)',
        //   'value': null,
        // },
        // 'r_price': {
        //   'longText': 'Retail Price (\$)',
        //   'value': null,
        // },
        // 'r_allow': {
        //   'longText': 'Retail Allowance (\$)',
        //   'value': null,
        // },
        // 'w_allow': {
        //   'longText': 'Wholesale Allowance (\$)',
        //   'value': null,
        // },
        'add_fp': {
          'longText': 'Additional Frame Payment (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.green,
        },
      },
    },
    color: AppColorPallet.green,
  ),
  Coverage(
    type: 'United Health (Spectra)',
    algorithm: {
      'Wholesale Allowance': uhswa,
      'Retail Allowance': uhsra,
    },
    subtype: {
      'Wholesale Allowance': {
        'wac': {
          'longText': 'Wholesale Acquisition Cost (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        // 'r_price': {
        //   'longText': 'Retail Price (\$)',
        //   'value': null,
        // },
        // 'r_allow': {
        //   'longText': 'Retail Allowance (\$)',
        //   'value': null,
        // },
        'w_allow': {
          'longText': 'Wholesale Allowance (\$)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        // 'add_fp': {
        //   'longText': 'Additional Frame Payment (\$)',
        //   'value': null,
        // },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.green,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.blue,
        },
      },
      'Retail Allowance': {
        'wac': {
          'longText': 'Wholesale Acquisition Cost (\$)',
          'value': null,
          'color': AppColorPallet.red,
        },
        'r_price': {
          'longText': 'Retail Price (\$)',
          'value': null,
          'color': AppColorPallet.orange,
        },
        'r_allow': {
          'longText': 'Retail Allowance (\$)',
          'value': null,
          'color': AppColorPallet.green,
        },
        // 'w_allow': {
        //   'longText': 'Wholesale Allowance (\$)',
        //   'value': null,
        // },
        // 'add_fp': {
        //   'longText': 'Additional Frame Payment (\$)',
        //   'value': null,
        // },
        'v_disc': {
          'longText': 'Vendor Discount (%)',
          'value': null,
          'color': AppColorPallet.blue,
        },
        'p_disc': {
          'longText': 'Patient Discount (%)',
          'value': null,
          'color': AppColorPallet.violet,
        },
      },
    },
    color: AppColorPallet.blue,
  ),
];
