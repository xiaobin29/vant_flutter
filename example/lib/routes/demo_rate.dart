import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:vant_flutter/main.dart';

class DemoRate extends StatefulWidget {
  @override
  _DemoRate createState() => _DemoRate();
}

class _DemoRate extends State<DemoRate> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title(AppLocalizations.of(context)!.basic_usage),
              Rate(
                value: 3,
              ),
              title(AppLocalizations.of(context)!.custom_icon),
              Rate(
                value: 3,
                icon: Icons.favorite,
                voidIcon: Icons.favorite_border,
                onChange: (val) {
                  Utils.toast("Rate changed: $val");
                },
              ),
              title(AppLocalizations.of(context)!.custom_style),
              Rate(
                value: 3,
                color: Colors.blueAccent,
                voidColor: Colors.blueAccent,
                size: 36.0,
                gutter: 8.0,
                onChange: (val) {
                  Utils.toast("Rate changed: $val");
                },
              ),
              title(AppLocalizations.of(context)!.custom_number),
              Rate(
                count: 7,
                value: 4,
              ),
              title(AppLocalizations.of(context)!.disabled_status),
              Rate(value: 3, disabled: true),
              title(AppLocalizations.of(context)!.readonly_status),
              Rate(value: 3, readonly: true)
            ]));
  }
}
