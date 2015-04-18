/*
	File: server_init.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

[] call compile preprocessFile "server\init\server_compiles.sqf";

_extDB = false;
_extDB = ["KOTH","SQL_CUSTOM_V2","KOTH"] call KOTH_extdb;

if (!_extDB) exitWith {
	server_status = false;
	publicVariable "server_status";
	diag_log "extDB: Failed to Load";
};

sleep 0.01;

server_tickets = [0,0,0];
publicVariable "server_tickets";

server_status = true;
publicVariable "server_status";