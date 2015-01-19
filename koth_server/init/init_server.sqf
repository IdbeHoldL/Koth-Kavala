[] call compile preprocessFile "koth_server\configs\config.sqf";

_extDB = false;
_extDB = [] call compile preprocessfilelinenumbers "koth_server\init\extDB\init.sqf";

if (!_extDB) exitWith
{
	server_status = false;
	publicVariable "server_status";

	diag_log "extDB: Failed to Load";
};

TICKETS_BLU = 0;
publicVariable "TICKETS_BLU";
TICKETS_RED = 0;
publicVariable "TICKETS_RED";
TICKETS_IND = 0;
publicVariable "TICKETS_IND";

//create Playground
[] call compile preprocessfilelinenumbers "koth_server\init\zone\init.sqf";

[] call compile preprocessfilelinenumbers "koth_server\init\vehicle\init.sqf";

sleep 0.01;

server_status = true;
publicVariable "server_status";

