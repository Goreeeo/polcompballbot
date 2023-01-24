import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/managers/localization.dart';

final addTestCommand = SlashCommandBuilder("add_test", "Adds a test to your profile.", [
  sapplyValuesCommand,
  dozenValuesCommand,
  econValuesCommand,
  eightValuesCommand,
  politicalCompass
],
localizationsName: {
  Locale.german: "test_hinzufügen"
},
localizationsDescription: {
  Locale.german: "Fügt deinem Profil einen Test hinzu."
});

final sapplyValuesCommand = CommandOptionBuilder(CommandOptionType.subCommand, "sapplyvalues", "Set your SapplyValues results.",
options: [
  CommandOptionBuilder(CommandOptionType.string, "link", "The link to your SapplyValues.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deinem SapplyValues."
  })
],
localizationsName: {
  Locale.german: "sapplyvalues"
},
localizationsDescription: {
  Locale.german: "Fügt dein SapplyValues hinzu."
})..registerHandler((event) async {
  String link = event.getArg("link").value;

  if (!link.toLowerCase().startsWith("https://sapplyvalues.github.io/results.html?") && !link.toLowerCase().startsWith("sapplyvalues.github.io/results.html?")) {
    await event.respond(MessageBuilder.content(Localization().get("invalid_sapply", event.interaction.locale)));
    return;
  }

  await Database().setSapplyValues(event.interaction.userAuthor!.id.id, link);
  await event.respond(MessageBuilder.content(Localization().get("successful_sapply", event.interaction.locale)));
});

final dozenValuesCommand = CommandOptionBuilder(CommandOptionType.subCommand, "dozenvalues", "Set your DozenValues results.",
options: [
  CommandOptionBuilder(CommandOptionType.string, "link", "The link to your DozenValues.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deinem DozenValues."
  })
],
localizationsName: {
  Locale.german: "dozenvalues"
},
localizationsDescription: {
  Locale.german: "Fügt dein DozenValues hinzu."
})..registerHandler((event) async {
  String link = event.getArg("link").value;

  if (!link.toLowerCase().startsWith("https://quark88.github.io/dozenvalues/results.html") && !link.toLowerCase().startsWith("quark88.github.io/dozenvalues/results.html")) {
    await event.respond(MessageBuilder.content(Localization().get("invalid_dozen", event.interaction.locale)));
    return;
  }

  await Database().setDozenValues(event.interaction.userAuthor!.id.id, link);
  await event.respond(MessageBuilder.content(Localization().get("successful_dozen", event.interaction.locale)));
});

final econValuesCommand = CommandOptionBuilder(CommandOptionType.subCommand, "econvalues", "Set your EconValues results.",
options: [
  CommandOptionBuilder(CommandOptionType.string, "link", "The link to your EconValues.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deinem EconValues."
  })
],
localizationsName: {
  Locale.german: "econvalues"
},
localizationsDescription: {
  Locale.german: "Fügt dein EconValues hinzu."
})..registerHandler((event) async {
  String link = event.getArg("link").value;

  if (!link.toLowerCase().startsWith("https://rayz9989.github.io/econvaluesrestore/results.html?") && !link.toLowerCase().startsWith("rayz9989.github.io/econvaluesrestore/results.html?")) {
    await event.respond(MessageBuilder.content(Localization().get("invalid_econ", event.interaction.locale)));
    return;
  }

  await Database().setEconValues(event.interaction.userAuthor!.id.id, link);
  await event.respond(MessageBuilder.content(Localization().get("successful_econ", event.interaction.locale)));
});

final eightValuesCommand = CommandOptionBuilder(CommandOptionType.subCommand, "eightvalues", "Set your 8Values results.",
options: [
  CommandOptionBuilder(CommandOptionType.string, "link", "The link to your 8Values.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deinem 8Values."
  })
],
localizationsName: {
  Locale.german: "eightvalues"
},
localizationsDescription: {
  Locale.german: "Fügt dein 8Values hinzu."
})..registerHandler((event) async {
  String link = event.getArg("link").value;

  if (!link.toLowerCase().startsWith("https://8values.github.io/results.html?") && !link.toLowerCase().startsWith("8values.github.io/results.html?")) {
    await event.respond(MessageBuilder.content(Localization().get("invalid_eight_values", event.interaction.locale)));
    return;
  }

  await Database().setEightValues(event.interaction.userAuthor!.id.id, link);
  await event.respond(MessageBuilder.content(Localization().get("successful_eight_values", event.interaction.locale)));
});

final politicalCompass = CommandOptionBuilder(CommandOptionType.subCommand, "political_compass", "Set your political compass results.",
options: [
  CommandOptionBuilder(CommandOptionType.string, "link", "The link to your political compass.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deinem politischen Kompass."
  })
],
localizationsName: {
  Locale.german: "politischer_kompass"
},
localizationsDescription: {
  Locale.german: "Fügt deinen politischen Kompass hinzu."
})..registerHandler((event) async {
  String link = event.getArg("link").value;

  if (!link.toLowerCase().startsWith("https://www.politicalcompass.org/analysis2?") && !link.toLowerCase().startsWith("www.politicalcompass.org/analysis2?")) {
    await event.respond(MessageBuilder.content(Localization().get("invalid_political_compass", event.interaction.locale)));
    return;
  }

  await Database().setPoliticalCompass(event.interaction.userAuthor!.id.id, link);
  await event.respond(MessageBuilder.content(Localization().get("successful_political_compass", event.interaction.locale)));
});