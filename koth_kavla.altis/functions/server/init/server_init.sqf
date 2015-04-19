/*
	File: server_init.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

[] call compile preprocessFile "functions\server\init\server_compiles.sqf";

_extDB = false;
_extDB = ["KOTH","SQL_CUSTOM_V2","KOTH"] call KOTH_extdb;

if (!_extDB) exitWith {
	KOTH_server = false;
	publicVariable "KOTH_server";
	diag_log "extDB: Failed to Load";
};

_config = [] call KOTH_loadConfig;

KOTH_config = _config;
publicVariable "KOTH_config";

KOTH_tickets = [0,0,0];
publicVariable "KOTH_tickets";

sleep 0.01;

KOTH_server = true;
publicVariable "KOTH_server";