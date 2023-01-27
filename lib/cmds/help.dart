import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:polcompballbot/managers/json_parser.dart';
import 'package:polcompballbot/managers/localization.dart';

final helpCommand = SlashCommandBuilder("help", "Gives you a description of every command.", [], 
localizationsName: {
  Locale.german: "hilfe"
},
localizationsDescription: {
  Locale.german: "Gibt eine Beschreibung jedes Commands."
})..registerHandler((event) async {
  Map<String, dynamic>? commands = await JsonParser().read("help");

  if (commands == null) {
    await event.respond(MessageBuilder.content(Localization().get("help_issue", event.interaction.locale)));
    return;
  }

  EmbedBuilder embed = EmbedBuilder();
  
  commands.forEach((key, value) { embed.addField(name: key, content: Localization().get(value, event.interaction.locale)); });

  await event.respond(MessageBuilder.embed(embed));
});