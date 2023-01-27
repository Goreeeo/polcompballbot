import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/cmds/help.dart';
import "package:polcompballbot/managers/environment.dart";
import 'package:polcompballbot/cmds/profile.dart';
import 'package:polcompballbot/cmds/add_test.dart';
import 'package:polcompballbot/cmds/set_ideology.dart';
import 'package:polcompballbot/cmds/set_region.dart';
import 'package:polcompballbot/managers/localization.dart';
import 'package:polcompballbot/objects/countries.dart';

// ignore: depend_on_referenced_packages
import "package:sqlite3/open.dart";

void main() {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);
  open.overrideFor(OperatingSystem.linux, _openOnLinux);

  Localization().init().then((value) {
    File("lib/tables/countries.json").readAsString().then((String content) {
      Countries().init(jsonDecode(content));

      final bot = NyxxFactory.createNyxxWebsocket(Environment().get("BOT_TOKEN") as String, GatewayIntents.allUnprivileged)
        ..registerPlugin(Logging())
        ..registerPlugin(CliIntegration())
        ..registerPlugin(IgnoreExceptions())
        ..connect();

      IInteractions.create(WebsocketInteractionBackend(bot))
        ..registerSlashCommand(setIdeologyCommand)
        ..registerSlashCommand(profileCommand)
        ..registerSlashCommand(setRegionCommand)
        ..registerSlashCommand(addTestCommand)
        ..registerSlashCommand(helpCommand)
        ..syncOnReady();
    });
  });
}

DynamicLibrary _openOnWindows() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File("${scriptDir.path}/sqlite3.def");
  return DynamicLibrary.open(libraryNextToScript.path);
}

DynamicLibrary _openOnLinux() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File("${scriptDir.path}/sqlite3");
  return DynamicLibrary.open(libraryNextToScript.path);
}