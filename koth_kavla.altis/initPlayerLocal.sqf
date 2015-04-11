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

/* Variables */

koth_soundLevel = false;

/*  Wait for 3D display  */
waitUntil { !isNull ( findDisplay 46 ) };

/*  Hide development watermark */
{
	( ( findDisplay 46) displayCtrl _x ) ctrlShow false;
} forEach [ 1000, 1001, 1002, 1200, 1202 ];

/* Loadout */
[] call KOTH_fnc_playerLoadout;

/*  Event Handlers */
[] call KOTH_fnc_initEventHandlers;

/*  HUD */
[] call KOTH_fnc_playerHud;

/*  BIS Group System */
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

/*  Add rating  */
player addRating 99999999;
player addScore 99999999;

/*  More */
player setVariable[ "nametag", profileName, true ];
player setVariable[ "steamID", getPlayerUID player ];
player setVariable [ "BIS_noCoreConversations", true ];