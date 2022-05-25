// <copyright file="image_manager.dart" company="AcerPro Bilişim Teknolojileri A.Ş.">
//     Copyright (c)
// </copyright>

import 'package:todoexample/core/constants/image/image_constant.dart';

class ImageManager {
  static ImageManager? _instance;
  static ImageManager get instance => _instance ??= ImageManager._init();
  ImageManager._init();
  String get logo => toPng(ImageConstants.APP_LOGO);
  String toPng(String name) => 'assets/images/$name.png';
}
