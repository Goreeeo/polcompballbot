import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/managers/localization.dart';

import '../objects/countries.dart';

final setRegionCommand = SlashCommandBuilder("set_region", "Sets your region of origin.",
[
  CommandOptionBuilder(CommandOptionType.string, "region", "Your region of origin.", required: true,
  localizationsName:{
    Locale.german: "region"
  },
  localizationsDescription:{
    Locale.german: "Deine Ursprungsregion"
  })
],
localizationsName:
{
  Locale.german: "ändere_region"
},
localizationsDescription:
{
  Locale.german: "Ändert deine Ursprungsregion."
})..registerHandler((event) async {
  String region = event.getArg("region").value.toString().toLowerCase();

  if (Countries().get(region) == null) {
    await event.respond(MessageBuilder.content(Localization().get("region_code_not_found", event.interaction.locale)));
    return;
  }

  await Database().setRegion(event.interaction.userAuthor!.id.id, region);
  switch (event.interaction.locale) {
    case "de":
      await event.respond(MessageBuilder.content("Region zu ${Countries().get(region)!.name} geändert."));
      break;
    default:
      await event.respond(MessageBuilder.content("Region set to ${Countries().get(region)!.name}."));
      break;
  }
});