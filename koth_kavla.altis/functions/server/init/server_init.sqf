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

[] call KOTH_markerConfig;

_config = [] call KOTH_loadConfig;

KOTH_config = _config;
publicVariable "KOTH_config";

KOTH_tickets_west = 0;
publicVariable "KOTH_tickets_west";
KOTH_tickets_ind = 0;
publicVariable "KOTH_tickets_ind";
KOTH_tickets_east = 0; 
publicVariable "KOTH_tickets_east";

sleep 0.01;

KOTH_server = true;
publicVariable "KOTH_server";

[] call KOTH_zoneUpdate;