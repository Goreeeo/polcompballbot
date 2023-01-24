import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';

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
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ungültiger SapplyValues link."));
        break;
      default:
        await event.respond(MessageBuilder.content("Invalid SapplyValues link."));
        break;
    }
    return;
  }

  await Database().setSapplyValues(event.interaction.userAuthor!.id.id, link);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("Erfolgreich SapplyValues Link hinzugefügt."));
      break;
    default:
      await event.respond(MessageBuilder.content("Set SapplyValues link successfully!"));
      break;
  }
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
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ungültiger DozenValues link."));
        break;
      default:
        await event.respond(MessageBuilder.content("Invalid DozenValues link."));
        break;
    }
    return;
  }

  await Database().setDozenValues(event.interaction.userAuthor!.id.id, link);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("Erfolgreich DozenValues link hinzugefügt!"));
      break;
    default:
      await event.respond(MessageBuilder.content("Set DozenValues link successfully!"));
      break;
  }
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
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ungültiger EconValues link."));
        break;
      default:
        await event.respond(MessageBuilder.content("Invalid EconValues link."));
        break;
    }
    return;
  }

  await Database().setEconValues(event.interaction.userAuthor!.id.id, link);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("Erfolgreich EconValues link hinzugefügt!"));
      break;
    default:
      await event.respond(MessageBuilder.content("Set EconValues link successfully!"));
      break;
  }
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
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ungültiger 8Values link."));
        break;
      default:
        await event.respond(MessageBuilder.content("Invalid 8Values link."));
        break;
    }
    return;
  }

  await Database().setEightValues(event.interaction.userAuthor!.id.id, link);
  switch (event.interaction.locale) {
    case "de": 
      await event.respond(MessageBuilder.content("Erfolgreich 8Values link hinzugefügt!"));
      break;
    default: 
      await event.respond(MessageBuilder.content("Set 8Values link successfully!"));
      break;
  }
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
    switch (event.interaction.locale) {
      case "de": 
        await event.respond(MessageBuilder.content("Ungültiger politischer Kompass link."));
        break;
      default: 
        await event.respond(MessageBuilder.content("Invalid political compass link."));
        break;
    }
    return;
  }

  await Database().setPoliticalCompass(event.interaction.userAuthor!.id.id, link);
  switch (event.interaction.locale) {
    case "de": 
      await event.respond(MessageBuilder.content("Erfolgreich politischen Kompass link gesetzt."));
      break;
    default: 
      await event.respond(MessageBuilder.content("Set political compass link successfully!"));
      break;
  }
});