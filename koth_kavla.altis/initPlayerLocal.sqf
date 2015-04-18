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

/* End Loading Screen */
endLoadingScreen;

0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;

/* Variables */
KOTH_earplugsOff = false;
KOTH_tagsOff = false;
KOTH_store = 0;

missionNamespace setVariable["player_stats",[0,0,0,0]];

0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//Server
waitUntil {sleep 0.01; (!(isNil "server_status"))};

if (!server_status) then {
	0 cutText["Error","BLACK FADED"];
	0 cutFadeOut 9999999;	
}
else
{
	/*  Wait for 3D display  */
	waitUntil { !isNull ( findDisplay 46 ) };

	/*  Hide development watermark */
	{
		( ( findDisplay 46) displayCtrl _x ) ctrlShow false;
	} forEach [ 1000, 1001, 1002, 1200, 1202 ];

	/* Loadout */
	[] call KOTH_fnc_playerLoadout;

	/*  Event Handlers */
	[] call KOTH_fnc_playerEH;

	/*  HUD */
	[] call KOTH_fnc_playerHud;
	
	/*  BIS Group System */
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

	/*  Add rating  */
	player addRating 99999999;
	player addScore 99999999;

	/*  More */
	player setVariable["nametag", profileName, true];
	player setVariable["steamID", getPlayerUID player];
	
	0 cutText ["","BLACK IN"];	
};	