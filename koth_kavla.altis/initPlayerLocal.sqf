/*
	File: initPlayerLocal.sqf
	Author: BAROD
	
	Description:
		Executed locally when player joins mission (includes both mission start and JIP)
	Parameters:
		NONE
*/

/* HC */
if( !hasInterface ) exitWith {}; 

/* Wait until player object is available */
waitUntil { !isNull player }; 

/* Wait for player object to be local */
waitUntil { local player };

0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;

/* Variables */
KOTH_soundLevel = false;
KOTH_TagsOn = false;
KOTH_store = 0;

missionNamespace setVariable["player_stats",[0,0,0,0]];
missionNamespace setVariable["ticket_stats",[0,0,0]];
missionNamespace setVariable["player_data",[]];

0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

/*  Wait for 3D display  */
waitUntil { !isNull ( findDisplay 46 ) };

/*  Hide development watermark */
{
	( ( findDisplay 46) displayCtrl _x ) ctrlShow false;
} forEach [ 1000, 1001, 1002, 1200, 1202 ];

/*  Add rating  */
player addRating 99999999;
player addScore 99999999;

/*  More */
player setVariable[ "nametag", profileName, true ];
player setVariable[ "steamID", getPlayerUID player ];

/* Loadout */
[] call KOTH_fnc_playerLoadout;

/*  Event Handlers */
[] call KOTH_fnc_playerEH;

/*  HUD */
[] call KOTH_fnc_playerHud;

/*  BIS Group System */
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

0 cutText ["","BLACK IN"];