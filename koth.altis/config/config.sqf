player_stats_add = [0,0,0];
player_stats_got = 0;
player_stats = [0,0,0];

player_vcooldown = false;
player_savecooldown = false;
player_loadoutcooldown = false;

if(isNil "spawntruck_blu") then {spawntruck_blu = 0;};
if(isNil "spawntruck_red") then {spawntruck_red = 0;};
if(isNil "spawntruck_ind") then {spawntruck_ind = 0;};