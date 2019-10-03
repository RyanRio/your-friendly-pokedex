import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;
import java.util.Random;

import javax.security.auth.login.LoginException;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import java.awt.event.ActionEvent;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import net.dv8tion.jda.core.EmbedBuilder;
import net.dv8tion.jda.core.JDA;
import net.dv8tion.jda.core.JDABuilder;
import net.dv8tion.jda.core.entities.Message;
import net.dv8tion.jda.core.entities.MessageEmbed;
import net.dv8tion.jda.core.events.message.MessageReceivedEvent;

public class Poke {

  JDA jda;

  public Connection getConnection(String user, String pass) throws SQLException {

    String url = "jdbc:mysql://localhost:3306";
    Properties info = new Properties();
    info.put("user", user);
    info.put("password", pass);

    Connection conn = DriverManager.getConnection(url, info);

    return conn;
  }

  public void run(String user, String pass) {

    Connection conn = null;

    try {
      jda = new JDABuilder("NTg5NTQzNjk3OTI2OTc5NjMy.XQVPng.QFH9PbCjIzXUH6sRu5G1vP-huP0").build();

      conn = this.getConnection(user, pass);

      Statement use = conn.createStatement();
      use.execute("use pokedex");
      use.close();

      System.out.println("success");
      // Do something with the Connection
    }
    catch (SQLException ex) {
      // handle any errors
      System.out.println("SQLException: " + ex.getMessage());
      System.out.println("SQLState: " + ex.getSQLState());
      System.out.println("VendorError: " + ex.getErrorCode());
    }
    catch (LoginException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    GUI gui = new GUI();
    jda.addEventListener(gui);
    // pass the gui for error logging
    jda.addEventListener(new MessageCommand(conn, gui));
  }

  public static void main(String[] args) {
    Poke app = new Poke();
    app.login();

  }

  private void login() {
    javax.swing.SwingUtilities.invokeLater(() -> this.createAndShowGUI());
  }

  public void createAndShowGUI() {
    // Create and set up the window.
    JFrame gui = new JFrame("LoginWindow");
    gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    gui.setLayout(new GridBagLayout());
    GridBagConstraints cs = new GridBagConstraints();

    cs.fill = GridBagConstraints.HORIZONTAL;

    JLabel lbUsername = new JLabel("Username: ");
    cs.gridx = 0;
    cs.gridy = 0;
    cs.gridwidth = 1;
    gui.add(lbUsername, cs);

    JTextField tfUsername = new JTextField(20);
    cs.gridx = 1;
    cs.gridy = 0;
    cs.gridwidth = 2;
    gui.add(tfUsername, cs);

    JLabel lbPassword = new JLabel("Password: ");
    cs.gridx = 0;
    cs.gridy = 1;
    cs.gridwidth = 1;
    gui.add(lbPassword, cs);

    JPasswordField pfPassword = new JPasswordField(20);
    cs.gridx = 1;
    cs.gridy = 1;
    cs.gridwidth = 2;
    gui.add(pfPassword, cs);

    JButton login = new JButton("Login");
    cs.gridx = 0;
    cs.gridy = 2;
    cs.gridwidth = 3;
    gui.add(login, cs);

    gui.pack();
    gui.setVisible(true);

    login.addActionListener((ActionEvent e) -> {
      char[] passL = pfPassword.getPassword();
      String pass = "";
      for (char p : passL) {
        pass += p;
      }


      
      this.run(tfUsername.getText(), pass);
      gui.setVisible(false);

    });
  }
}

class PokeUtils {

  String prefix = ">";

  List<String> commandList = new ArrayList<String>(Arrays.asList(
      "pcommands", 
      "phelp", 
      "pdetails", 
      "pgroupsearch",
      "psizesearch", 
      "pregionsearch", 
      "pregistertrainer",
      "pweakness", 
      "pteamweaknesses", 
      "pteam",
      "pcreateteam", 
      "pdeleteteam", 
      "paddtoteam", 
      "pdeletefromteam",
      "paboutitem", 
      "pevolve",
      "pregisterprofessor"));

  List<String> descriptions = new ArrayList<String>(Arrays.asList(
      "displays all available commands",
      "gets help with a specific command",
      "shows details of a pokemon, pdetails 'pokemon name'", 
      "shows the names of many pokemon, pgroupsearch type1 type2 egg_group, replace any search argument with x"
      + " to broaden the search",
      "shows the sizes of a pokemon, ex. psizesearch > 10 < 20",
      "shows names of many pokemon that belong to a region, pregionsearch 'region'",
      "registers yourself as a trainer, pregistertrainer 'trainer name'",
      "shows the weaknesses of a pokemon, pweakness 'pokemon'",
      "shows all weaknesses of your team, pteamweaknesses 'team name'",
      "displays your team, pteam 'team name'",
      "creates a team, pcreateteam 'team name'", 
      "deletes a team, pdeleteteam 'team name'",
      "adds a pokemon to your team, paddtoteam 'team name' 'pokemon' 'nickname'",
      "delete a pokemon from your team, pdeletefromteam 'team name' 'nickname'",
      "get information on an item, paboutitem 'item name'",
      "get information on a pokemon evolution, pevolve 'pokemon name'",
      "register as a professor, pregisterprofessor 'name' 'gender (Male or Female)' 'region' 'town'"));

  String[] getCommand(MessageReceivedEvent event) throws IllegalArgumentException {
    Message message = event.getMessage();
    String content = message.getContentRaw();
    // getContentRaw() is aan atomic getter

    if (!content.startsWith(this.prefix))
      throw new IllegalArgumentException("missing prefix!");

    String cmd = content.substring(1);

    // split by spaces
    String[] pieces = cmd.split(" ");

    if (!commandList.contains(pieces[0])) {
      throw new IllegalArgumentException("invalid command!");
    }

    return pieces;
  }

  MessageEmbed getCommandEmbed() {
    EmbedBuilder builder = new EmbedBuilder();

    for (int i = 0; i < commandList.size(); i += 1) {
      builder.addField(commandList.get(i), descriptions.get(i), false);
    }

    return builder.build();
  }

  MessageEmbed getCommandHelp(String cmd) {
    EmbedBuilder builder = new EmbedBuilder();

    int index = -1;

    for (int i = 0; i < commandList.size(); i += 1) {
      if (commandList.get(i).equals(cmd)) {
        index = i;
        break;
      }
    }
    
    if(index!= -1) {
      builder.addField(commandList.get(index), descriptions.get(index), false);
    }
    else {
      builder.addField("Command: " + cmd + " doesn't exist!", "please use >pcommands for a list of commands", false);
    }
    return builder.build();
  }

}

interface StatBounds {
  int maxBase = 100;
  int minBase = 20;

  int minIV = 1;
  int maxIV = 31;

  int minEV = 0;
  int maxEV = 252;

  int minLvl = 1;
  int maxLvl = 100;
}

/**
 * randomizes a pokemons stats
 * 
 * @author Ryan
 *
 */
class Stat implements StatBounds {
  Random r;

  int health;
  int spdef;
  int def;
  int atk;
  int spd;
  int spatk;
  int iv_h;
  int iv_spdef;
  int iv_def;
  int iv_atk;
  int iv_spd;
  int iv_spatk;
  String gender;
  int pokemon_lvl;

  Stat(long seed) {
    this.r = new Random(seed);

    ArrayList<String> genderOptions = new ArrayList<String>(Arrays.asList("M", "F", "Genderless"));
    int gender = r.nextInt(3);
    this.gender = genderOptions.get(gender);

    this.pokemon_lvl = r.nextInt(maxLvl - minLvl) + minLvl;

    this.iv_h = r.nextInt(maxIV - minIV) + minIV;
    this.iv_spdef = r.nextInt(maxIV - minIV) + minIV;
    this.iv_def = r.nextInt(maxIV - minIV) + minIV;
    this.iv_atk = r.nextInt(maxIV - minIV) + minIV;
    this.iv_spd = r.nextInt(maxIV - minIV) + minIV;
    this.iv_spatk = r.nextInt(maxIV - minIV) + minIV;

    int HPbase = r.nextInt(maxBase - minBase) + minBase;
    int SPDEFbase = r.nextInt(maxBase - minBase) + minBase;
    int DEFbase = r.nextInt(maxBase - minBase) + minBase;
    int ATKbase = r.nextInt(maxBase - minBase) + minBase;
    int SPDbase = r.nextInt(maxBase - minBase) + minBase;
    int SPATKbase = r.nextInt(maxBase - minBase) + minBase;

    int totalEV = 510;

    int HPEV = r.nextInt(maxEV - minEV) + minEV;
    totalEV -= HPEV;

    // choose the smaller maxEV (cant excede a total of totalEV
    int SPDEFEV = r.nextInt(Math.min(maxEV, totalEV) - minEV) + minEV;
    totalEV -= SPDEFEV;

    int DEFEV = r.nextInt(Math.min(maxEV, totalEV) - minEV) + minEV;
    totalEV -= DEFEV;

    int ATKEV = r.nextInt(Math.min(maxEV, totalEV) - minEV) + minEV;
    totalEV -= ATKEV;

    int SPDEV = r.nextInt(Math.min(maxEV, totalEV) - minEV) + minEV;
    totalEV -= SPDEV;

    int SPATKEV = r.nextInt(Math.min(maxEV, totalEV) - minEV) + minEV;

    this.health = ((2 * HPbase + this.iv_h + (HPEV / 4) + 100) * this.pokemon_lvl) / 100 + 10;

    this.spdef = ((2 * SPDEFbase + this.iv_spdef + (SPDEFEV / 4)) * this.pokemon_lvl) / 100 + 5;

    this.def = ((2 * DEFbase + this.iv_spdef + (DEFEV / 4)) * this.pokemon_lvl) / 100 + 5;

    this.atk = ((2 * ATKbase + this.iv_spdef + (ATKEV / 4)) * this.pokemon_lvl) / 100 + 5;

    this.spd = ((2 * SPDbase + this.iv_spdef + (SPDEV / 4)) * this.pokemon_lvl) / 100 + 5;

    this.spatk = ((2 * SPATKbase + this.iv_spdef + (SPATKEV / 4)) * this.pokemon_lvl) / 100 + 5;
    // every time
  }
}
