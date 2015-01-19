waitUntil {!isNull player && player == player};
endLoadingScreen;

player_stats_add = [0,0,0];
player_stats_got = 0;
player_stats = [0,0,0];

player_vcooldown = false;
player_savecooldown = false;
player_loadoutcooldown = false;

[[player], "player_fnc_loadStats", false, false] spawn BIS_fnc_MP;

[] spawn client_fnc_loadout;
[] spawn client_fnc_hudUpdate;
[] spawn client_fnc_thirdPersonView;
[] spawn client_fnc_addEventhandlers;

[] execVM "init\actions\init.sqf";

