import 'package:polcompballbot/database/database.dart';
import 'package:polcompballbot/managers/localization.dart';
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
    await event.respond(MessageBuilder.content(Localization().get("no_polcompball_associated", event.interaction.locale)));
    return;
  }
  if (user.ideology == null) {
    await event.respond(MessageBuilder.content(Localization().get("no_polcompball_associated", event.interaction.locale)));
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
    embed.fields.add(EmbedFieldBuilder(Localization().get("profile_ideology", event.interaction.locale), titles[0]["title"]));
    embed.fields.add(EmbedFieldBuilder(Localization().get("profile_summary", event.interaction.locale), ideology.description));
    embed.fields.add(EmbedFieldBuilder("Link", ideology.link));
  } else {
    await event.respond(MessageBuilder.content(Localization().get("polcompball_server_issue", event.interaction.locale)));
    return;
  }

  if (user.region != null) {
    embed.fields.add(EmbedFieldBuilder("Region", Countries().get(user.region as String)!.name));
  }

  await event.respond(MessageBuilder.embed(embed));

  ITextChannel channel = await event.interaction.channel.getOrDownload();

  if (user.dozenvalues != null) {
    List<double>? dv = TestParser().parseDozen(Uri.dataFromString(user.dozenvalues as String));

    if (dv != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;

      embed.title = "**DozenValues**";
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_ownership", event.interaction.locale), dv[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_market", event.interaction.locale), dv[1], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_power", event.interaction.locale), dv[2], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_autonomy", event.interaction.locale), dv[3]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_identity", event.interaction.locale), dv[4], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("dozen_value_progress", event.interaction.locale), dv[5], true));

      embed.fields.add(EmbedFieldBuilder("Link", user.dozenvalues));
      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }

  if (user.sapplyvalues != null) {
    List<double>? sv = TestParser().parseSapply(Uri.dataFromString(user.sapplyvalues as String));

    if (sv != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;

      embed.title = "**SapplyValues**";
      embed.fields.add(EmbedFieldBuilder(Localization().get("left_right", event.interaction.locale), sv[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("auth_lib", event.interaction.locale), sv[1], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("prog_con", event.interaction.locale), sv[2], true));

      embed.fields.add(EmbedFieldBuilder("Link", user.sapplyvalues));

      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }

  if (user.econvalues != null) {
    List<double>? ev = TestParser().parseEcon(Uri.dataFromString(user.econvalues as String));

    if (ev != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;

      embed.title = "**EconValues**";
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_incentive", event.interaction.locale), ev[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_structure", event.interaction.locale), ev[1], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_intervention", event.interaction.locale), ev[2], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_centralisation", event.interaction.locale), ev[3]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_technology", event.interaction.locale), ev[4], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_land", event.interaction.locale), ev[5], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_inheritance", event.interaction.locale), ev[6]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("econ_value_labor", event.interaction.locale), ev[7], true));
      embed.fields.add(EmbedFieldBuilder("Link", user.econvalues));

      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }

  if (user.eightvalues != null) {
    List<double>? ev = TestParser().parseEight(Uri.dataFromString(user.eightvalues as String));

    if (ev != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;

      embed.title = "**EightValues**";
      embed.fields.add(EmbedFieldBuilder(Localization().get("eight_value_economic", event.interaction.locale), ev[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("eight_value_diplomacy", event.interaction.locale), ev[1], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("eight_value_civil", event.interaction.locale), ev[2], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("eight_value_societal", event.interaction.locale), ev[3], true));
      embed.fields.add(EmbedFieldBuilder("Link", user.eightvalues));

      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }

  if (user.culturalvalues != null) {
    List<double>? cv = TestParser().parseCultural(Uri.dataFromString(user.culturalvalues as String));

    if (cv != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;
      
      embed.title = "**CulturalValues**";
      
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_ethnic", event.interaction.locale), cv[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_cultural", event.interaction.locale), cv[1], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_preference", event.interaction.locale), cv[2], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_acceptance", event.interaction.locale), cv[3]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_pluralism", event.interaction.locale), cv[4], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_external", event.interaction.locale), cv[5], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_progression", event.interaction.locale), cv[6]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_technology", event.interaction.locale), cv[7], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_lgbt", event.interaction.locale), cv[8], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_nation", event.interaction.locale), cv[9]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_religion", event.interaction.locale), cv[10], true));
      embed.fields.add(EmbedFieldBuilder(Localization().get("cultural_value_philosophy", event.interaction.locale), cv[11], true));

      embed.fields.add(EmbedFieldBuilder("Link", user.culturalvalues));

      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }

  if (user.politicalcompass != null) {
    Tuple2<String, List<double>>? pc = TestParser().parseCompass(Uri.dataFromString(user.politicalcompass as String));

    if (pc != null) {
      EmbedBuilder embed = EmbedBuilder();
      EmbedAuthorBuilder author = EmbedAuthorBuilder();
      author.name = targetMember.nickname ?? targetUser.username;
      author.iconUrl = targetMember.avatarURL() ?? targetUser.avatarURL();
      embed.author = author;
      embed.imageUrl = pc.item1;

      embed.title = "**Political Compass**";
      embed.fields.add(EmbedFieldBuilder(Localization().get("left_right", event.interaction.locale), pc.item2[0]));
      embed.fields.add(EmbedFieldBuilder(Localization().get("auth_lib", event.interaction.locale), pc.item2[1], true));

      embed.fields.add(EmbedFieldBuilder("Link", user.politicalcompass));

      await channel.sendMessage(MessageBuilder.embed(embed));
    }
  }
});