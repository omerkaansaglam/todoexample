// <copyright file="provider_list.dart" company="AcerPro Bilişim Teknolojileri A.Ş.">
//     Copyright (c)
// </copyright>

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todoexample/core/init/theme/custom_theme.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => CustomThemeData()),
  ];
}
