import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/database/string_to_ideology.dart';

final setIdeologyCommand = SlashCommandBuilder("set_ideology", "Sets your ideology.", 
[
  CommandOptionBuilder(CommandOptionType.string, "ideology", "The ideology you wish to have.", required: true)
],
localizationsName:
{
  Locale.german: "wähle_ideologie"
},
localizationsDescription:
{
  Locale.german: "Die Ideologie die du wählen möchtest."
})..registerHandler((event) async {
  int? ideology = StringIdeologyConverter().getIdeology(event.getArg("ideology").value);

  if (ideology is! int) {
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Ideologie existiert nicht in der Datenbank. Überprüfe deine Rechtschreibung oder erstelle eine neue mit dem /erstelle_ideologie command."));
        break;
      default:
        await event.respond(MessageBuilder.content("Ideology doesn't exist in database. Check your spelling or create it by using the /create_ideology command."));
        break;
    }
    return;
  }

  await Database().setIdeology(event.interaction.userAuthor!.id.id, ideology);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("Ideologie wurde zu ${event.getArg("ideology").value} gesetzt."));
      break;
    default:
      await event.respond(MessageBuilder.content("Ideology set to ${event.getArg("ideology").value}."));
      break;
  }
});