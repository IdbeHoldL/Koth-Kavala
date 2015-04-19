/*
	File: initPlayerServer.sqf
	Author: BAROD
	
	Description:
		Executed only on server when a player joins mission (includes both mission start and JIP)
	Parameters:
		NONE
*/

waitUntil {sleep 0.01; (!(isNil "KOTH_server"))};

if (KOTH_server) then {
	_this call KOTH_playerLoad;
};