import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/database/string_to_ideology.dart';

final createIdeologyCommand = SlashCommandBuilder("create_ideology", "Creates an ideology.", 
[
  CommandOptionBuilder(CommandOptionType.string, "name", "The ideology you wish to create.", required: true,
  localizationsName: {
    Locale.german: "name"
  },
  localizationsDescription: {
    Locale.german: "Die Ideologie die du erstellen möchtest."
  }),
  CommandOptionBuilder(CommandOptionType.string, "summary", "A summary of the ideology.", required: true,
  localizationsName: {
    Locale.german: "kurzfassung"
  },
  localizationsDescription: {
    Locale.german: "Eine Kurzfassung der Ideologie."
  }),
  CommandOptionBuilder(CommandOptionType.string, "polcompball_link", "The link to your ideology.", required: true,
  localizationsName: {
    Locale.german: "polcompball_link"
  },
  localizationsDescription: {
    Locale.german: "Der Link zu deiner Ideologie."
  })
], 
localizationsName: {
  Locale.german: "erstelle_ideologie"
},
localizationsDescription: {
  Locale.german: "Kreiert eine Ideologie."
})..registerHandler((event) async {
  String name = event.getArg("name").value;

  if (StringIdeologyConverter().getIdeology(name) is int) {
    print(event.interaction.locale);
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ideology existiert bereits."));
        break;
      default:
        await event.respond(MessageBuilder.content("Ideology already exists."));
        break;
    }
    return;
  }

  String link = event.getArg("polcompball_link").value;

  if (!link.toLowerCase().startsWith("https://polcompballanarchy.miraheze.org/wiki/") && !link.toLowerCase().startsWith("https://polcompball.miraheze.org/wiki/") && !link.toLowerCase().startsWith("polcompballanarchy.miraheze.org/wiki/") && !link.toLowerCase().startsWith("polcompball.miraheze.org/wiki/")) {
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Artikel muss zu einem https://polcompball.miraheze.org oder https://polcompballanarchy.miraheze.org Artikel führen."));
        break;
      default:
        await event.respond(MessageBuilder.content("Link must lead to a https://polcompball.miraheze.org or https://polcompballanarchy.miraheze.org article."));
        break;
    }
    return;
  }

  Ideology ideology = await Database().createIdeology(name, event.getArg("summary").value, link);
  StringIdeologyConverter().add(ideology);

  await Database().setIdeology(event.interaction.userAuthor!.id.id, ideology.id);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("$name wurde erfolgreich erstellt!"));
      break;
    default:
      await event.respond(MessageBuilder.content("Successfully created $name!"));
      break;
  }
});