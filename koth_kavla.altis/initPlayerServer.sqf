/*
	File: initPlayerServer.sqf
	Author: BAROD
	
	Description:
		Executed only on server when a player joins mission (includes both mission start and JIP)
	Parameters:
		NONE
*/

waitUntil {sleep 0.01; (!(isNil "server_status"))};

if (server_status) then {
	_this call KOTH_playerLoad;
};