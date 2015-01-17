if (!isServer) exitWith {};

_extDB = false;
_extDB = [] call compile preprocessfilelinenumbers "db_functions\extdbSetup.sqf";

if (!_extDB) exitWith
{
	diag_log "extDB: Failed to Load";
};
