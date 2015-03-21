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
endLoadingScreen;

KOTH_stats_add = [0,0,0];
KOTH_stats = [0,0,0];

waitUntil {sleep 0.01; (!(isNil "KOTH_GAME"))};
if ( !KOTH_GAME ) then { 

	cutText [ "......", "BLACK"]; 
	
} else {

	cutText [ "Client......", "BLACK"]; 
};