import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/managers/test_parser.dart';
import 'package:tuple/tuple.dart';
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

  if (user.dozenvalues != null) {
    List<double>? dv = TestParser().parseDozen(Uri.dataFromString(user.dozenvalues as String));

    if (dv == null) return;

    EmbedBuilder embed = EmbedBuilder();
    EmbedAuthorBuilder author = EmbedAuthorBuilder();
    author.name = targetMember.nickname ?? targetUser.username;
    author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
    embed.author = author;

    embed.title = "**DozenValues**";
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Besitz - Gleichheit/Eigentum", dv[0]));
        embed.fields.add(EmbedFieldBuilder("Markt - Koordiniert/Handel", dv[1], true));
        embed.fields.add(EmbedFieldBuilder("Staatsmacht - Herrschaft/Anarchie", dv[2], true));
        embed.fields.add(EmbedFieldBuilder("Autonomie - Freiheit/Einschränkung", dv[3]));
        embed.fields.add(EmbedFieldBuilder("Identität - Inklusivität/Vorherrschaft", dv[4], true));
        embed.fields.add(EmbedFieldBuilder("Fortschritt - Erbschaft/Neuheit", dv[5], true));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Ownership - Equality/Property", dv[0]));
        embed.fields.add(EmbedFieldBuilder("Market - Coordination/Commerce", dv[1], true));
        embed.fields.add(EmbedFieldBuilder("Power - Dominion/Anarchy", dv[2], true));
        embed.fields.add(EmbedFieldBuilder("Autonomy - Permission/Restriction", dv[3]));
        embed.fields.add(EmbedFieldBuilder("Identity - Inclusivity/Supremacy", dv[4], true));
        embed.fields.add(EmbedFieldBuilder("Progress - Heritage/Novelty", dv[5], true));
        break;
    }

    embed.fields.add(EmbedFieldBuilder("Link", user.dozenvalues));
    await event.sendFollowup(MessageBuilder.embed(embed));
  }

  if (user.sapplyvalues != null) {
    List<double>? sv = TestParser().parseSapply(Uri.dataFromString(user.sapplyvalues as String));

    if (sv == null) return;

    EmbedBuilder embed = EmbedBuilder();
    EmbedAuthorBuilder author = EmbedAuthorBuilder();
    author.name = targetMember.nickname ?? targetUser.username;
    author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
    embed.author = author;

    embed.title = "**SapplyValues**";
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Links/Rechts", sv[0]));
        embed.fields.add(EmbedFieldBuilder("Autoritär/Libertär", sv[1], true));
        embed.fields.add(EmbedFieldBuilder("Progressiv/Konservativ", sv[2], true));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Left/Right", sv[0]));
        embed.fields.add(EmbedFieldBuilder("Authoritarian/Libertarian", sv[1], true));
        embed.fields.add(EmbedFieldBuilder("Progressive/Conservative", sv[2], true));
        break;
    }

    embed.fields.add(EmbedFieldBuilder("Link", user.sapplyvalues));

    await event.sendFollowup(MessageBuilder.embed(embed));
  }

  if (user.econvalues != null) {
    List<double>? ev = TestParser().parseEcon(Uri.dataFromString(user.econvalues as String));

    if (ev == null) return;

    EmbedBuilder embed = EmbedBuilder();
    EmbedAuthorBuilder author = EmbedAuthorBuilder();
    author.name = targetMember.nickname ?? targetUser.username;
    author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
    embed.author = author;

    embed.title = "**EconValues**";
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Anreiz - Gerechtigkeit/Konkurrenz", ev[0]));
        embed.fields.add(EmbedFieldBuilder("Struktur - Horizontal/Hierarchie", ev[1], true));
        embed.fields.add(EmbedFieldBuilder("Eingriff - Nachfrage/Regulation", ev[2], true));
        embed.fields.add(EmbedFieldBuilder("Zentralisierung - Zentral/Lokal", ev[3]));
        embed.fields.add(EmbedFieldBuilder("Technologie - Automatisierung/Angestellte", ev[4], true));
        embed.fields.add(EmbedFieldBuilder("Land - Gemeinsam/Miete", ev[5], true));
        embed.fields.add(EmbedFieldBuilder("Erbschaft - Geburt/Verdienst", ev[6]));
        embed.fields.add(EmbedFieldBuilder("Arbeit - Gewerkschaftlich/Geteilt", ev[7], true));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Incentive - Equity/Competition", ev[0]));
        embed.fields.add(EmbedFieldBuilder("Structure - Horizontal/Hierarchy", ev[1], true));
        embed.fields.add(EmbedFieldBuilder("Intervention - Demand/Regulation", ev[2], true));
        embed.fields.add(EmbedFieldBuilder("Centralisation - Central/Local", ev[3]));
        embed.fields.add(EmbedFieldBuilder("Technology - Automation/Employment", ev[4], true));
        embed.fields.add(EmbedFieldBuilder("Land - Commons/Rent", ev[5], true));
        embed.fields.add(EmbedFieldBuilder("Inheritance - Birthright/Merit", ev[6]));
        embed.fields.add(EmbedFieldBuilder("Labor - Unionized/Divided", ev[7], true));
        break;
    }
    embed.fields.add(EmbedFieldBuilder("Link", user.econvalues));

    await event.sendFollowup(MessageBuilder.embed(embed));
  }

  if (user.eightvalues != null) {
    List<double>? ev = TestParser().parseEcon(Uri.dataFromString(user.eightvalues as String));

    if (ev == null) return;

    EmbedBuilder embed = EmbedBuilder();
    EmbedAuthorBuilder author = EmbedAuthorBuilder();
    author.name = targetMember.nickname ?? targetUser.username;
    author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
    embed.author = author;

    embed.title = "**EightValues**";
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Wirtschaftlich - Gleichheit/Märkte", ev[0]));
        embed.fields.add(EmbedFieldBuilder("Diplomatie - Volk/International", ev[1], true));
        embed.fields.add(EmbedFieldBuilder("Zivil - Freheit/Autorität", ev[2], true));
        embed.fields.add(EmbedFieldBuilder("Sozial - Tradition/Fortschritt", ev[3], true));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Economic - Equality/Markets", ev[0]));
        embed.fields.add(EmbedFieldBuilder("Diplomatic - Nation/Globe", ev[1], true));
        embed.fields.add(EmbedFieldBuilder("Civil - Liberty/Authority", ev[2], true));
        embed.fields.add(EmbedFieldBuilder("Societal - Tradition/Progress", ev[3], true));
        break;
    }
    embed.fields.add(EmbedFieldBuilder("Link", user.eightvalues));

    await event.sendFollowup(MessageBuilder.embed(embed));
  }

  if (user.politicalcompass != null) {
    Tuple2<String, List<double>>? pc = TestParser().parseCompass(Uri.dataFromString(user.politicalcompass as String));

    if (pc == null) return;

    EmbedBuilder embed = EmbedBuilder();
    EmbedAuthorBuilder author = EmbedAuthorBuilder();
    author.name = targetMember.nickname ?? targetUser.username;
    author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
    embed.author = author;
    embed.imageUrl = pc.item1;

    embed.title = "**Political Compass**";
    switch (event.interaction.locale) {
      case "de":
        embed.fields.add(EmbedFieldBuilder("Links/Rechts", pc.item2[0]));
        embed.fields.add(EmbedFieldBuilder("Autoritär/Libertär", pc.item2[1], true));
        break;
      default:
        embed.fields.add(EmbedFieldBuilder("Left/Right", pc.item2[0]));
        embed.fields.add(EmbedFieldBuilder("Auth/Lib", pc.item2[1], true));
        break;
    }

    embed.fields.add(EmbedFieldBuilder("Link", user.politicalcompass));

    await event.sendFollowup(MessageBuilder.embed(embed));
  }
});