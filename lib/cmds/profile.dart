import 'package:polcompballbot/database/database.dart';
import "package:web_scraper/web_scraper.dart";

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';

import '../objects/countries.dart';
final profileCommand = SlashCommandBuilder("profile", "Show someone's profile.", 
[
  CommandOptionBuilder(CommandOptionType.user, "user", "The user you wish to see the profile of.", required: true,
  localizationsName:
  {
    Locale.german: "nutzer"
  },
  localizationsDescription: 
  {
    Locale.german: "Der Nutzer dessen Profil du ansehen möchtest."
  })
],
localizationsName: 
{
  Locale.german: "profil"
},
localizationsDescription:
{
  Locale.german: "Zeigt das Profil von jemandem an."
})..registerHandler((event) async {
  await event.acknowledge();

  String userId = event.getArg("user").value;
  User? user = await Database().getById(int.parse(userId));
  if (user == null) {
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Dieser Nutzer hat keinen assoziierten PolCompBall."));
        break;
      default:
        await event.respond(MessageBuilder.content("This user does not have a PolCompBall associated with them."));
        break;
    }
    return;
  }
  if (user.ideology == null) {
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Dieser Nutzer hat keinen assoziierten PolCompBall."));
        break;
      default:
        await event.respond(MessageBuilder.content("This user does not have a PolCompBall associated with them."));
        break;
    }
    return;
  }
  Ideology ideology = await Database().getIdeologyById(user.ideology as int);

  IGuild guild = await event.interaction.guild!.getOrDownload();
  IMember targetMember = await guild.fetchMember(Snowflake.value(int.parse(userId)));
  IUser targetUser = await targetMember.user.getOrDownload();

  EmbedBuilder embed = EmbedBuilder();
  EmbedAuthorBuilder author = EmbedAuthorBuilder();
  author.name = targetMember.nickname ?? targetUser.username;
  author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
  embed.author = author;
  
  final webScraper = WebScraper();
  if (await webScraper.loadFullURL(ideology.link)) {
    List<Map<String, dynamic>> images = webScraper.getElement("img.pi-image-thumbnail", ["src"]);
    if (images.isEmpty) return;
    embed.thumbnailUrl = "https:${images[0]["attributes"]["src"]}";
    List<Map<String, dynamic>> titles = webScraper.getElement("span.mw-page-title-main", []);
    if (titles.isEmpty) return;
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Ideologie", titles[0]["title"]));
        embed.fields.add(EmbedFieldBuilder("Kurzfassung", ideology.description));
        embed.fields.add(EmbedFieldBuilder("Link", ideology.link));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Ideology", titles[0]["title"]));
        embed.fields.add(EmbedFieldBuilder("Summary", ideology.description));
        embed.fields.add(EmbedFieldBuilder("Link", ideology.link));
        break;
    }
  } else {
    switch (event.interaction.locale) {
      case "de":
        await event.respond(MessageBuilder.content("Es gab ein Problem dabei auf die PolCompBall Server zuzugreifen."));
        break;
      default:
        await event.respond(MessageBuilder.content("There was an issue accessing the polcompball servers."));
        break;
    }
    return;
  }

  if (user.region != null) {
    embed.fields.add(EmbedFieldBuilder("Region", Countries().get(user.region as String)!.name));
  }

  await event.respond(MessageBuilder.embed(embed));
});