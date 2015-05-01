/*
	File: server_init.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

_extDB = false;
_extDB = ["KOTH","SQL_CUSTOM_V2","KOTH"] call compile preprocessfilelinenumbers "koth_server\functions\extDB\fn_extdb.sqf";

if (!_extDB) exitWith {
	KOTH_server = false;
	publicVariable "KOTH_server";
	diag_log "extDB: Failed to Load";
};

[] call BAROD_fnc_marker;

KOTH_config = [] call BAROD_fnc_config;
publicVariable "KOTH_config";

//PVEH
"KOTH_onPlayerSave" addPublicVariableEventHandler {(_this select 1) spawn BAROD_fnc_playerSave};

KOTH_tickets_west = 0;
publicVariable "KOTH_tickets_west";
KOTH_tickets_ind = 0;
publicVariable "KOTH_tickets_ind";
KOTH_tickets_east = 0; 
publicVariable "KOTH_tickets_east";

sleep 0.01;

KOTH_server = true;
publicVariable "KOTH_server";

[] call BAROD_fnc_zone;