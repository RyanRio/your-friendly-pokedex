import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import net.dv8tion.jda.core.EmbedBuilder;
import net.dv8tion.jda.core.JDA;
import net.dv8tion.jda.core.entities.MessageEmbed;
import net.dv8tion.jda.core.events.ReadyEvent;
import net.dv8tion.jda.core.events.ShutdownEvent;
import net.dv8tion.jda.core.events.message.MessageReceivedEvent;
import net.dv8tion.jda.core.hooks.ListenerAdapter;

class MessageCommand extends ListenerAdapter {

  String prefix = ">";
  Connection conn;
  GUI gui;
  private final PokeUtils utils = new PokeUtils();

  /**
   * 
   * @param conn connection to mysql database
   * @param gui  needs gui to log errors
   */
  public MessageCommand(Connection conn, GUI gui) {
    this.conn = conn;
    this.gui = gui;
  }

  @Override
  public void onMessageReceived(MessageReceivedEvent event) {
    if (event.getAuthor().isBot())
      return;

    String[] pieces;
    try {
      pieces = this.utils.getCommand(event);
    }
    catch (IllegalArgumentException e) {
      System.out.println(e.getMessage());
      return;
    }

    // run command
    try {
      String cmd = pieces[0];
      // get all the details of a pokemon
      if (cmd.equals("pdetails")) {
        if (pieces.length != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }
        String poke_name = pieces[1];
        Statement stmt = this.conn.createStatement();
        ResultSet details = this.callProcedure("pokemon_details", stmt, poke_name);
        // assumes a resultset containing from Pokemon table
        MessageEmbed msg = this.showPokemon(details);
        event.getChannel().sendMessage(msg).queue();
        details.close();
        stmt.close();
      }
      // search for a pokemon by type or egg group or both
      else if (cmd.equals("pgroupsearch")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        // incorrect args
        if (num_pieces != 4) {
          this.sendInvalidCommand(event, cmd);
          return;
        }
        String type1 = pieces[1];
        String type2 = pieces[2];
        String egg_grp = pieces[3];
        ResultSet pokemons = this.callProcedure("group_search", stmt, type1, type2, egg_grp);

        List<String> titles = new ArrayList<String>();
        if (!type1.equals("x")) {
          titles.add("type: " + type1);
        }
        if (!type2.equals("x")) {
          titles.add("type: " + type2);
        }
        if (!egg_grp.equals("x")) {
          titles.add("Egg Group: " + egg_grp);
        }

        MessageEmbed msg = this.displayPokeNames(pokemons, titles);
        event.getChannel().sendMessage(msg).queue();
        stmt.close();
      }
      // search for a pokemon by size
      else if (cmd.equals("psizesearch")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();

        if (num_pieces != 5) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String wOp = pieces[1];
        String weight = (pieces[2]);
        String hOp = pieces[3];
        String height = (pieces[4]);

        ResultSet pokemons = this.callProcedure("size_search", stmt, wOp, weight, hOp, height);

        List<String> titles = new ArrayList<String>();
        titles.add("weight " + wOp + weight + " and height " + hOp + height);
        MessageEmbed msg = this.displayPokeNames(pokemons, titles);
        event.getChannel().sendMessage(msg).queue();
        stmt.close();
      }
      // search for a pokemon by region
      else if (cmd.equals("pregionsearch")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();

        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String region = pieces[1];

        ResultSet pokemons = this.callProcedure("pokemon_in_region", stmt, region);

        List<String> titles = new ArrayList<String>();
        titles.add("region: " + region);
        MessageEmbed msg = this.displayPokeNames(pokemons, titles);
        event.getChannel().sendMessage(msg).queue();
        stmt.close();
      }
      // register a trainer
      else if (cmd.equals("pregistertrainer")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String name = pieces[1];

        boolean trainerExists = this.callFunction("trainer_exists", stmt,
            event.getAuthor().getId());

        if (!trainerExists) {
          this.callProcedure("register_trainer", stmt, event.getAuthor().getId(), name);
          event.getChannel().sendMessage("Welcome to the pokemon world " + name + "!").queue();
          ;
        }
        else {
          event.getChannel().sendMessage("You are already a trainer! Go catch some Pokemon!")
              .queue();
        }
        stmt.close();
      }
      // find weaknesses
      else if (cmd.equals("pweakness")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String name = pieces[1];

        ResultSet weak = this.callProcedure("poke_weaknesses", stmt, name);

        MessageEmbed msg = this.displayTypes(weak, "Weakness", "Multiplier",
            name + " is weak against: ");
        event.getChannel().sendMessage(msg).queue();
        stmt.close();
      }
      // gets the weaknesses of the pokemon
      else if (cmd.equals("pteamweaknesses")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        Statement stmt2 = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];

        ResultSet weak = this.callProcedure("greatestweakness", stmt, event.getAuthor().getId(),
            teamName);

        ResultSet team = this.callProcedure("team", stmt2, event.getAuthor().getId(), teamName);

        MessageEmbed msg = this.displayTypes(team, weak, "Weakness", "Multiplier",
            "Your team is weak against: ");

        event.getChannel().sendMessage(msg).queue();
        stmt.close();
        stmt2.close();
      }
      // gets the team
      else if (cmd.equals("pteam")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];

        boolean hasTeam = this.callFunction("team_exists", stmt, event.getAuthor().getId(),
            teamName);

        if (!hasTeam) {
          event.getChannel().sendMessage("This team doesn't exist! Use 'pcreateteam' to start it'")
              .queue();
          ;
        }
        else {
          ResultSet team = this.callProcedure("team", stmt, event.getAuthor().getId(), teamName);
          MessageEmbed msg = this.displayTeam(team);
          event.getChannel().sendMessage(msg).queue();
        }
        stmt.close();
      }
      // creates the team
      else if (cmd.equals("pcreateteam")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];

        boolean hasTeam = this.callFunction("team_exists", stmt, event.getAuthor().getId(),
            teamName);

        if (hasTeam) {
          event.getChannel()
              .sendMessage("This team already exists! Give your new team a different name.")
              .queue();
          ;
        }
        else {
          this.callProcedure("createteam", stmt, event.getAuthor().getId(), teamName);
          event.getChannel().sendMessage("Your team: " + teamName + " has been created!").queue();
        }
        stmt.close();
      }
      // deletes the team
      else if (cmd.equals("pdeleteteam")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];

        boolean hasTeam = this.callFunction("team_exists", stmt, event.getAuthor().getId(),
            teamName);

        if (hasTeam) {
          this.callProcedure("deleteteam", stmt, event.getAuthor().getId(), teamName);
          event.getChannel().sendMessage("Your team: " + teamName + " has been deleted!").queue();
        }
        else {
          event.getChannel().sendMessage("This team doesn't exist!").queue();
        }

        stmt.close();
      }
      // adds to team
      else if (cmd.equals("paddtoteam")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 4) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];
        // name of pokemon
        String poke = pieces[2];
        // nickname for pokestat
        String nickName = pieces[3];

        String trainer_id = event.getAuthor().getId();

        if (this.callFunction("pokemon_exists", stmt, poke)) {
          if (this.callFunction("team_exists", stmt, trainer_id, teamName)) {

            Stat st = new Stat(System.currentTimeMillis());

            this.callProcedure("createStat", stmt, nickName, poke, trainer_id,
                String.valueOf(st.health), String.valueOf(st.spdef), String.valueOf(st.def),
                String.valueOf(st.atk), String.valueOf(st.spd), String.valueOf(st.spatk),
                String.valueOf(st.iv_h), String.valueOf(st.iv_spdef), String.valueOf(st.iv_def),
                String.valueOf(st.iv_atk), String.valueOf(st.iv_spd), String.valueOf(st.iv_spatk),
                st.gender, String.valueOf(st.pokemon_lvl));

            // both team and pokemon exists
            int row = this.callFunctionInt("which_row", stmt, trainer_id, teamName);

            this.callProcedure("addtoteam", stmt, trainer_id, teamName, nickName,
                String.valueOf(row));

            ResultSet team = this.callProcedure("team", stmt, trainer_id, teamName);
            MessageEmbed msg = this.displayTeam(team);
            event.getChannel().sendMessage(msg).queue();
          }
          else {
            event.getChannel().sendMessage("This team doesn't exist!").queue();
          }
        }
        else {
          event.getChannel().sendMessage("This pokemon doesn't exist!").queue();
        }
        
        stmt.close();

      }
      // gets commands
      else if (cmd.equals("pcommands")) {
        event.getAuthor().openPrivateChannel()
            .queue((channel) -> channel.sendMessage(utils.getCommandEmbed()).queue());
        
      }
      // gets help for a command
      else if (cmd.equals("phelp")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String cmdName = pieces[1];

        event.getChannel().sendMessage(utils.getCommandHelp(cmdName)).queue();
        
        stmt.close();
      }

      // deletes from team
      else if (cmd.equals("pdeletefromteam")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 3) {
          this.sendInvalidCommand(event, cmd);
          return;
        }

        String teamName = pieces[1];
        // name of pokemon
        String nickname = pieces[2];

        String trainer_id = event.getAuthor().getId();

        if (this.callFunction("team_exists", stmt, trainer_id, teamName)) {
          if (this.callFunction("team_has", stmt, trainer_id, teamName, nickname)) {
            int whichrow = this.callFunctionInt("which_rowname", stmt, trainer_id, teamName,
                nickname);

            this.callProcedure("deletefromteam", stmt, trainer_id, teamName,
                String.valueOf(whichrow));

            ResultSet team = this.callProcedure("team", stmt, trainer_id, teamName);
            MessageEmbed msg = this.displayTeam(team);
            event.getChannel().sendMessage(msg).queue();
          }
          else {
            event.getChannel().sendMessage("This pokemon isn't in your team!").queue();
          }
        }
        else {
          event.getChannel().sendMessage("This team doesn't exist!").queue();
        }
        
        stmt.close();
      }
      // asks about item
      else if (cmd.equals("paboutitem")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces < 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }
        
        String itemName = "";
        
        for (int i=1; i < pieces.length; i+=1) {
          String p = pieces[i];
          if(i < pieces.length-1) {
            itemName += p + " ";
          }
          else {
            itemName += p;
          }
        }
        
        ResultSet rs = this.callProcedure("about_item", stmt, itemName);
        
        event.getChannel().sendMessage(this.displayItems(rs)).queue();
        
        stmt.close();

      }
      // gets evolution information
      else if (cmd.equals("pevolve")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 2) {
          this.sendInvalidCommand(event, cmd);
          return;
        }
        
        String name = pieces[1];
        
        ResultSet rs = this.callProcedure("pevolve", stmt, name);
        
        event.getChannel().sendMessage(this.displayEvos(rs, name)).queue();
        
        stmt.close();
      }
      // register as professor
      else if (cmd.equals("pregisterprofessor")) {
        int num_pieces = pieces.length;
        Statement stmt = this.conn.createStatement();
        if (num_pieces != 5) {
          this.sendInvalidCommand(event, cmd);
          return;
        }
        String id = event.getAuthor().getId();
        String name = pieces[1];
        String gender = pieces[2];
        String region = pieces[3];
        String town = pieces[4];
        
        this.callProcedure("register_professor", stmt, id, name, gender, region, town);
        
        stmt.close();
      }
    }
    catch (SQLException ex) {
      this.gui.logError(ex);
    }
    catch (Exception e) {
      this.gui.logError(e);
    }

  }
  
  
  // display evolution rs
  private MessageEmbed displayEvos(ResultSet rs, String name) throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();
    builder.setTitle("Evolutions for: " + name);
    
    while (rs.next()) {
      builder.addField("Item required", this.conv(rs.getString("item")), true);
      builder.addField("evolves into: ", this.conv(rs.getString("post_poke_name")), true);
      builder.addField("Evolution description: ", this.conv(rs.getString("evo_description")), false);
    }
    
    return builder.build();
    
  }
  
  // display item rs
  private MessageEmbed displayItems(ResultSet rs) throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();
    builder.setTitle("Item Description!");
    
    while (rs.next()) {
      builder.addField(rs.getString("item_name"), rs.getString("item_description"), false);
    }
    
    return builder.build();
    
  }
  /**
   * if a given input is null return "None" - for message building
   * 
   * @param toConvert the possibly null string
   * @return itself or None
   */
  private String conv(String toConvert) {
    if (toConvert == null) {
      return "None";
    }
    else {
      return toConvert;
    }
  }

  // display team rs
  private MessageEmbed displayTeam(ResultSet teamRes) throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();

    while (teamRes.next()) {
      builder.setTitle("Team " + teamRes.getString("team_name"));
      String p1 = teamRes.getString("p1");
      String p1Nick = teamRes.getString("p1_nickname");
      builder.addField("1: ", "Nickname: " + this.conv(p1Nick) + ", Pokemon: " + this.conv(p1),
          false);

      String p2 = teamRes.getString("p2");
      String p2Nick = teamRes.getString("p2_nickname");
      builder.addField("2: ", "Nickname: " + this.conv(p2Nick) + ", Pokemon: " + this.conv(p2),
          false);

      String p3 = teamRes.getString("p3");
      String p3Nick = teamRes.getString("p3_nickname");
      builder.addField("3: ", "Nickname: " + this.conv(p3Nick) + ", Pokemon: " + this.conv(p3),
          false);

      String p4 = teamRes.getString("p4");
      String p4Nick = teamRes.getString("p4_nickname");
      builder.addField("4: ", "Nickname: " + this.conv(p4Nick) + ", Pokemon: " + this.conv(p4),
          false);

      String p5 = teamRes.getString("p5");
      String p5Nick = teamRes.getString("p5_nickname");
      builder.addField("5: ", "Nickname: " + this.conv(p5Nick) + ", Pokemon: " + this.conv(p5),
          false);

      String p6 = teamRes.getString("p6");
      String p6Nick = teamRes.getString("p6_nickname");
      builder.addField("6: ", "Nickname: " + this.conv(p6Nick) + ", Pokemon: " + this.conv(p6),
          false);
    }

    return builder.build();
  }

  // display type rs
  private MessageEmbed displayTypes(ResultSet typeMult, String typeName, String multName,
      String title) throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();
    builder.setTitle(title);

    while (typeMult.next()) {
      String type = typeMult.getString(typeName);
      double mult = typeMult.getDouble(multName);
      builder.addField(typeName + ": " + type, multName + ": " + mult + "x", true);
    }
    return builder.build();
  }

  // display type rs with team rs
  private MessageEmbed displayTypes(ResultSet teamRes, ResultSet typeMult, String typeName,
      String multName, String title) throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();
    builder.setTitle(title);

    while (typeMult.next()) {
      String type = typeMult.getString(typeName);
      double mult = typeMult.getDouble(multName);
      builder.addField(typeName + ": " + type, multName + ": " + mult + "x", true);
    }

    while (teamRes.next()) {
      String team_name = teamRes.getString("team_name");
      builder.addField("Your team: " + team_name, "", false);
      String p1 = teamRes.getString("p1");
      String p1Nick = teamRes.getString("p1_nickname");
      builder.addField("1: ", "Nickname: " + this.conv(p1Nick) + ", Pokemon: " + this.conv(p1),
          false);

      String p2 = teamRes.getString("p2");
      String p2Nick = teamRes.getString("p2_nickname");
      builder.addField("2: ", "Nickname: " + this.conv(p2Nick) + ", Pokemon: " + this.conv(p2),
          false);

      String p3 = teamRes.getString("p3");
      String p3Nick = teamRes.getString("p3_nickname");
      builder.addField("3: ", "Nickname: " + this.conv(p3Nick) + ", Pokemon: " + this.conv(p3),
          false);

      String p4 = teamRes.getString("p4");
      String p4Nick = teamRes.getString("p4_nickname");
      builder.addField("4: ", "Nickname: " + this.conv(p4Nick) + ", Pokemon: " + this.conv(p4),
          false);

      String p5 = teamRes.getString("p5");
      String p5Nick = teamRes.getString("p5_nickname");
      builder.addField("5: ", "Nickname: " + this.conv(p5Nick) + ", Pokemon: " + this.conv(p5),
          false);

      String p6 = teamRes.getString("p6");
      String p6Nick = teamRes.getString("p6_nickname");
      builder.addField("6: ", "Nickname: " + this.conv(p6Nick) + ", Pokemon: " + this.conv(p6),
          false);

    }

    return builder.build();
  }

  // give user assistance
  private void sendInvalidCommand(MessageReceivedEvent event, String cmd) {
    event.getAuthor().openPrivateChannel().queue((channel) -> {
      channel.sendMessage("You used the command: " + cmd + " improperly!").queue();
      channel.sendMessage(utils.getCommandHelp(cmd)).queue();
    });
  }

  // display pokemon rs
  private MessageEmbed displayPokeNames(ResultSet pokemons, List<String> titles)
      throws SQLException {
    EmbedBuilder builder = new EmbedBuilder();
    String mainTitle = "Pokemon Search Results for:";
    for (String title : titles) {
      mainTitle += " " + title;
    }

    builder.setTitle(mainTitle);
    int count = 0;
    String nameGroup = "";
    int totalLength = 0;

    while (pokemons.next()) {

      String pokeName = pokemons.getString("pokemon_name");
      totalLength += pokeName.length();
      nameGroup += pokeName;

      if (totalLength > 5800) {
        builder.addField("", nameGroup, false);
        break;
      }

      count += 1;
      if ((count > 0 && count % 10 == 0) || nameGroup.length() > 1000) {
        count = 10;
        builder.addField("", nameGroup, false);
        nameGroup = "";
      }
      else {
        if (pokemons.isLast()) {
          builder.addField("", nameGroup, false);
        }
        else {
          nameGroup += ", ";
          totalLength += 2;
        }
      }
    }

    System.out.println(totalLength);
    return builder.build();

  }

  // display specific pokemon details rs
  private MessageEmbed showPokemon(ResultSet details) throws SQLException {

    EmbedBuilder builder = new EmbedBuilder();

    while (details.next()) {

      String name = details.getString("pokemon_name");
      builder.addField("Pokemon Name", name, true);
      int id = details.getInt("pokemon_id");
      builder.addField("Pokemon ID", String.valueOf(id), true);
      String prof_name = details.getString("professor_name");
      builder.addField("Discovered by: ", prof_name, true);

      double height = details.getDouble("height");
      builder.addField("Height", String.valueOf(height), true);
      double weight = details.getDouble("weight");
      builder.addField("Weight", String.valueOf(weight), true);
      double ratio_gender = details.getDouble("gender_ratio_wild");
      if (ratio_gender == -1) {
        builder.addField("Gender Ratio In Wild", "no gender", true);
      }
      else {
        builder.addField("Gender Ratio In Wild", String.valueOf(ratio_gender), true);
      }

      String ability1 = details.getString("ability1");
      builder.addField("First Ability", ability1, true);
      String ability2 = details.getString("ability2");
      if (ability2 != null) {
        builder.addField("Second Ability", ability2, true);
      }
      else {
        builder.addBlankField(true);
      }
      String hidden_ability = details.getString("hidden_ability");
      if (hidden_ability != null) {
        builder.addField("Hidden Ability", hidden_ability, true);
      }
      else {
        builder.addBlankField(true);
      }

      String group1 = details.getString("egg_group1_name");
      builder.addField("First Egg Group", group1, true);
      String group2 = details.getString("egg_group2_name");
      if (group2 != null) {
        builder.addField("Second Egg Group", group2, true);
      }
      else {
        builder.addBlankField(true);
      }
      builder.addBlankField(true);

      String type1 = details.getString("pokemon_type_1");
      builder.addField("First Type", type1, true);

      String type2 = details.getString("pokemon_type_2");
      if (type2 != null) {
        builder.addField("Second Type", type2, true);
      }

      return builder.build();
    }

    return builder.build();
  }

  // call arbitrary procedure
  private ResultSet callProcedure(String procedureName, Statement stmt, String... args)
      throws SQLException {

    String argConcat = "";

    for (int i = 0; i < args.length; i += 1) {
      argConcat += "'" + args[i] + "'";
      if (i != args.length - 1) {
        argConcat += ", ";
      }
    }

    String query = "CALL " + procedureName + "(" + argConcat + ")";

    System.out.println(query);

    stmt.execute(query);

    ResultSet rs = stmt.getResultSet();
    return rs;
  }

  // call boolean returning function
  private boolean callFunction(String functionName, Statement stmt, String... args)
      throws SQLException {

    String argConcat = "";

    for (int i = 0; i < args.length; i += 1) {
      argConcat += "'" + args[i] + "'";
      if (i != args.length - 1) {
        argConcat += ", ";
      }
    }

    String query = "SELECT " + functionName + "(" + argConcat + ") as bool";

    System.out.println(query);

    stmt.execute(query);

    ResultSet rs = stmt.getResultSet();

    rs.next();
    boolean ret = rs.getBoolean("bool");
    rs.close();
    return ret;
  }

  // call funciton that returns int
  private int callFunctionInt(String functionName, Statement stmt, String... args)
      throws SQLException {

    String argConcat = "";

    for (int i = 0; i < args.length; i += 1) {
      argConcat += "'" + args[i] + "'";
      if (i != args.length - 1) {
        argConcat += ", ";
      }
    }

    String query = "SELECT " + functionName + "(" + argConcat + ") as bool";

    System.out.println(query);

    stmt.execute(query);

    ResultSet rs = stmt.getResultSet();

    rs.next();
    int ret = rs.getInt("bool");
    rs.close();
    return ret;
  }

}

class GUI extends ListenerAdapter {

  JFrame gui;
  JLabel error;

  public void createAndShowGUI(JDA jda) {
    // Create and set up the window.
    gui = new JFrame("PokedexBot");
    gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    gui.setLayout(new GridBagLayout());
    GridBagConstraints cs = new GridBagConstraints();

    cs.fill = GridBagConstraints.HORIZONTAL;

    cs.gridx = 0;
    cs.gridy = 0;
    cs.gridwidth = 4;
    JButton close = new JButton("close");
    gui.add(close, cs);

    this.error = new JLabel("Errors will appear here");
    cs.gridx = 0;
    cs.gridy = 1;
    cs.gridwidth = 4;
    gui.add(this.error, cs);

    gui.pack();
    gui.setVisible(true);

    close.addActionListener((ActionEvent e) -> {
      jda.shutdown();
    });

  }

  // log error on gui for admin
  public void logError(Exception e) {
    String sTrace = e.getStackTrace()[0].toString();
    this.error.setText(e.getMessage() + " call: " + sTrace);
    this.gui.pack();
  }

  @Override
  // when discord is ready
  public void onReady(ReadyEvent event) {
    System.out.println("logging in");
    javax.swing.SwingUtilities.invokeLater(() -> createAndShowGUI(event.getJDA()));
  }

  @Override
  // when discord shutdowns
  public void onShutdown(ShutdownEvent event) {
    gui.dispatchEvent(new WindowEvent(gui, WindowEvent.WINDOW_CLOSING));
  }

}