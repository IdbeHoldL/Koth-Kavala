/*
	File: initPlayerLocal.sqf
	Author: BAROD
	
	Description:
		Executed locally when player joins mission (includes both mission start and JIP).
	Parameters:
		NONE
*/

/* Override BIS_fnc_MP packet EH */
"BIS_fnc_MP_packet" addPublicVariableEventHandler { _this call KOTH_fnc_MPexec };

/* HC */
if( !hasInterface ) exitWith {}; 

/* Wait until player object is available */
waitUntil { !isNull player }; 

/* Wait for player object to be local */
waitUntil { local player };
cutText ["Loading......", "BLACK"];

KOTH_stats_add = [0,0,0];
KOTH_stats = [0,0,0];

waitUntil {sleep 0.01; (!(isNil "KOTH_GAME"))};

if ( !KOTH_GAME ) exitWith { 
	cutText [ "......", "BLACK"]; 
};

[[player], "player_fnc_loadStats", false, false] spawn KOTH_fnc_MP;
waitUntil {KOTH_PlayerReady};

/*  Wait for 3D display  */
waitUntil { !isNull ( findDisplay 46 ) };

/*  Hide development watermark */
{
	( ( findDisplay 46) displayCtrl _x ) ctrlShow false;
} forEach [ 1000, 1001, 1002, 1200, 1202 ];

[] call KOTH_fnc_addEventhandlers;

/*  Add rating  */
player addRating 99999999;
player addScore 99999999;

/*  More */
player setVariable[ "nametag", profileName, true ];
player setVariable[ "steamID", getPlayerUID player ];
player setVariable [ "BIS_noCoreConversations", true ];

/* true  */
KOTH_init = true;
