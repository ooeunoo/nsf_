import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nsf/nfs_app.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
