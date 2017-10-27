==========
FantaStats
==========

FantaStats is a command line application that  tracks player and game statistics for fantasy football.

Features:
  * Users can save a fantasy football team and have the ability to add and drop players from their team.
  * Users can view various player statistics and calculations.
  * Users can view game statistics

#NOTE:
Every Fantasy Football League has different rules as far as stat calculation for, and stats tracked. As of this version, the stats tracked are listed below, and the calculations for scoring
is included in the /lib/app/FantasyScoring.rb module. If your league rules differ you can adjust the formulas accordingly. Feel free to fork and adapt these for your league!



#User Guide

Fantasy Team Menu
-----------------
  1. Display Roster - Displays the entire roster of a fantasy team.
  2. Add to Roster - Adds a player to the roster by entering the player’s full name.
  3. Drop from Roster - Drops a player from the roster by entering the player’s full name.

Player Stats Menu
-----------------
  1. Game Stats for Games Played in a Season - Displays stats for all games played in a season for a player
  2. Points-Per-Game Average - Displays the average fantasy points earned per game in a season for a player.
  3. Player Stats for a Game Played - Displays stats for a game played by a player.
  4. Fantasy Points Earned in a Week - Displays fantasy points earned by player for a given week.
  5. Top 5 for a Position in a Season - Displays the top 5 players in a season for a given position.
  6. Player Consistency Rating - Gives the player’s consistency rating. The consistency rating the is the standard deviation of average fantasy points scored in a season divided by the average fantasy points.

Game Stats Menu
---------------
  1. MVP of the Game - Displays the player with the most points earned in a given game. Choose games by week, and select a game from the list
  2. MVP of the Week - Displays the player with the most points earned in a given week across all games in the NFL.

Stats Tracked
-------------
The following stats are tracked by FantaStats:
  * Pass Yds
  * Pass TDs
  * Pass 2pt
  * Pass Int
  * Rec Yds
  * Rec TDs
  * Rec 2pt
  * Rush Yds
  * Rush TDs
  * Rush 2pt
  * Fumbles
