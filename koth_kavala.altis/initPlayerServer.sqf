/*
	File: initPlayerServer.sqf
	Author: BAROD
	
	Description:
		Executed only on server when a player joins mission (includes both mission start and JIP)
	Parameters:
		NONE
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler { _this call KOTH_fnc_MPexec };
waitUntil {sleep 0.01; (!(isNil "KOTH_GAME"))};

if ( KOTH_GAME ) then {
	_this call BAROD_fnc_loadStats;
};