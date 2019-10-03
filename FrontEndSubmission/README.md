# Discord Pokedex

This discord pokedex bot is an interactable database containing detailed information on over 700 pokemon in which a discord user within a server which contains the bot may create, update, and delete pokemon teams, or simply learn from the information within the pokedex. 

## Installation

1. create a https://discordapp.com/ account
2. Do either step 3 or step 4
3. create a discord server then open this link https://discordapp.com/api/oauth2/authorize?client_id=589543697926979632&permissions=0&scope=bot 
	a. select your server in the dropdown menu and select 'add to server,' the bot is now in your server
4. OR just join our discord which already contains the bot: https://discord.gg/UqrMhbV
	(if you do so, skip step 3)
5. download and run pokedex.jar (everything is repackaged into pokedex), install and run anywhere
	a. uses https://github.com/DV8FromTheWorld/JDA
	b. uses https://dev.mysql.com/downloads/connector/j/
	c. uses https://docs.oracle.com/javase/8/docs/api/index.html?javax/swing/package-summary.html
6. Use your root mysql username and password to access the data within the database and hit login
7. You should see the bot go online
8. Enter commands as you wish

## Usage

```
Join or create a discord server with the bot that is run by the pokedex.jar file.

currently existing commands:
>pcommands 		# displays all available commands
>phelp 			# gets help with a specific command
>pdetails 		# shows details of a pokemon, pdetails 'pokemon name'
>pgroupsearch 		# shows the names of many pokemon, pgroupsearch type1 type2 egg_group, replace any search argument with x to broaden the search
>psizesearch 		# shows the sizes of a pokemon, ex. psizesearch > 10 < 20
>pregionsearch 		# shows names of many pokemon that belong to a region, pregionsearch 'region' 
>pregistertrainer 	# registers yourself as a trainer, pregistertrainer 'trainer name'
>pweakness 		# shows the weaknesses of a pokemon, pweakness 'pokemon'
>pteamweaknesses 	# shows all weaknesses of your team, pteamweaknesses 'team name'
>pteam 			# displays your team, pteam 'team name'
>pcreateteam 		# creates a team, pcreateteam 'team name'
>pdeleteteam 		# deletes a team, pdeleteteam 'team name'
>paddtoteam 		# adds a pokemon to your team, paddtoteam 'team name' 'pokemon'
>pdeletefromteam 	# delete a pokemon from your team, pdeletefromteam 'team name' 'nickname'
>paboutitem 		# get information on an item, paboutitem 'item name'
>pevolve 		# get information on a pokemon evolution, pevolve 'pokemon name'
>pregisterprofessor 	# register as a professor, pregisterprofessor 'name' 'gender (Male or Female)', 'region' 'town'
```
NOTE: when calling a command, do not use quotation marks for the entered values. For example:
```
>pregistertrainer Ash 	# will register you as a trainer named Ash. Limited to one registration per discord user
```