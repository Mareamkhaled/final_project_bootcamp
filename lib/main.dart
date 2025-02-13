import 'package:device_preview/device_preview.dart';
import 'package:final_project_bootcamp/core/Routing/routing.dart';
import 'package:final_project_bootcamp/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(routing: Routing()),),
      );
    



