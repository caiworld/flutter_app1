import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Locale资源类
class DemoLocalizations {
  bool isZh = false;

  DemoLocalizations(this.isZh);

  // 为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  // Locale相关之，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

// 其他的值
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();
//  static DemoLocalizationsDelegate delegate = DemoLocalizationsDelegate();

  /// 是否支持某个Locale
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  /// 当Localizations组件重新build时，是否调用load方法重新加载Locale资源
  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("xxxx$locale");
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == 'zh'));
  }
}
