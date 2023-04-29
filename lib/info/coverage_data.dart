import 'package:mcare_calculator/info/app_color_pallet.dart';
import 'package:mcare_calculator/models/coverage_model.dart';

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
    profit: {
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
    profit: {
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
    profit: {
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
    profit: {
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
    color: AppColorPallet.blue,
  ),
];

Map<String, dynamic> map = {
  'f_profit': 0.00, // ecp_profit
  'p_pays': 0.00, // patient_pays
  'i_pays': 0.00, // ins_pays
  't_rec': 0.00, // ecp_gets
  'f_cost': 0.00, // ecp_cost
};

Map vsp(Map<String, dynamic> values) {
  if (values['wac'] <= values['w_allow']) {
    map['t_rec'] = values['wac'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['p_pays'] = 0.00;
    if (values['add_fp'] > 0) {
      map['t_rec'] += values['add_fp'];
    }
    map['i_pays'] = map['t_rec'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  } else {
    map['t_rec'] = values['r_price'] - values['r_allow'];
    if (values['p_disc'] > 0) {
      map['t_rec'] = map['t_rec'] * (1 - (values['p_disc'] / 100));
    }
    map['p_pays'] = map['t_rec'];
    map['i_pays'] = values['w_allow'];
    if (values['add_fp'] > 0) {
      map['i_pays'] += values['add_fp'];
    }
    map['t_rec'] += map['i_pays'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  }
  return map;
}

Map eyeMed(Map<String, dynamic> values) {
  if (values['r_price'] <= values['r_allow']) {
    map['t_rec'] = map['i_pays'] = values['retail'] / values['f_factor'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  } else {
    map['t_rec'] = values['r_price'] - values['r_allow'];
    if (values['p_disc'] > 0) {
      map['t_rec'] = map['t_rec'] * (1 - (values['p_disc'] / 100));
    }
    map['p_pays'] = map['t_rec'];
    map['i_pays'] = values['r_allow'] / values['f_factor'];
    map['t_rec'] += map['i_pays'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  }
  return map;
}

Map davisNonCovered(Map<String, dynamic> values) {
  if (values['r_price'] <= values['r_allow']) {
    map['t_rec'] = map['i_pays'] = values['pf_payment'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  } else {
    map['t_rec'] = values['r_price'] - values['r_allow'];
    if (values['p_disc'] > 0) {
      map['t_rec'] = map['t_rec'] * (1 - (values['p_disc'] / 100));
    }
    map['p_pays'] = map['t_rec'];
    map['i_pays'] = values['pf_payment'];
    map['t_rec'] += map['i_pays'];
    map['f_cost'] = (values['v_disc'] > 0)
        ? values['wac'] * (1 - (values['v_disc'] / 100))
        : values['wac'];
    map['f_profit'] = map['t_rec'] - map['f_cost'];
  }
  return map;
}

Map davisCovered(Map<String, dynamic> values) {
  map['f_profit'] = values['add_fp'];
  return map;
}

Map uhswa(Map<String, dynamic> values) {
  if (values['wac'] > values['w_allow']) {
    map['p_pays'] = values['wac'] - values['w_allow'];
  }
  return map;
}

Map uhsra(Map<String, dynamic> values) {
  if (values['r_price'] > values['r_allow']) {
    map['t_rec'] = values['r_price'] - values['r_allow'];
    if (values['p_disc'] > 0) {
      map['t_rec'] = map['t_rec'] * (1 - (values['p_disc'] / 100));
    }
    map['p_pays'] = map['t_rec'];
    map['t_rec'] = 0.00;
  }
  return map;
}
