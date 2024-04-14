import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nsf/nfs_app.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await GetStorage.init();
      await dotenv.load(fileName: Assets.env);
      await Supabase.initialize(
        url: ENV.SUPABASE_URL,
        anonKey: ENV.SUPABASE_ANON_KEY,
      );
      await initializeDateFormatting('ko_KR', null);

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then((_) => runApp(const NSFApp()));
    },
    (error, stackTrace) async {
      print(error);
    },
  );
}
