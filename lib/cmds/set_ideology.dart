import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';

final setIdeologyCommand = SlashCommandBuilder("set_ideology", "Sets your ideology.", 
[
  CommandOptionBuilder(CommandOptionType.string, "link", "The PCB or PCBA link of the ideology you wish to have.", required: true,
  localizationsName: {
    Locale.german: "link"
  },
  localizationsDescription: {
    Locale.german: "Der PCB oder PCBA link von der Ideologie die du haben möchtest."
  })
],
localizationsName:
{
  Locale.german: "wähle_ideologie"
},
localizationsDescription:
{
  Locale.german: "Ändert deine Ideologie."
})..registerHandler((event) async {
  String ideology = event.getArg("ideology").value;

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