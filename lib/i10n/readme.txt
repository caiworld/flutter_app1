根据arb生成dart文件：
执行命令：
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i10n --no-use-deferred-loading lib/i10n/localization_intl.dart i10n-arb/intl_*.arb
注：“i10n-arb/intl_*.arb”在windows下可能会报错，因为windows下
无法识别*通配符，可以选择改成具体文件，一个一个的运行：(仔细看下面命令的最后面，连续执行了两个文件)
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i10n --no-use-deferred-loading lib/i10n/localization_intl.dart i10n-arb/intl_zh_CN.arb i10n-arb/intl_en_US.arb