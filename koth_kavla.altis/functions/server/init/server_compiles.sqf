/*
	File: server_compiles.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

//extdb
KOTH_asyncCall = compileFinal preprocessFileLineNumbers "functions\server\extdb\fn_async.sqf";
KOTH_extdb = compileFinal preprocessFileLineNumbers "functions\server\extdb\fn_extdb.sqf";
KOTH_strip = compileFinal preprocessFileLineNumbers "functions\server\extdb\fn_strip.sqf";

//Player
KOTH_playerSave = compileFinal preprocessFileLineNumbers "functions\server\player\fn_playerSave.sqf";
KOTH_playerLoad = compileFinal preprocessFileLineNumbers "functions\server\player\fn_playerLoad.sqf";

//Config
KOTH_loadConfig = compileFinal preprocessFileLineNumbers "functions\server\init\server_config.sqf";
KOTH_zoneUpdate = compileFinal preprocessFileLineNumbers "functions\server\init\server_zone.sqf";
KOTH_markerConfig = compileFinal preprocessFileLineNumbers "functions\server\init\server_marker.sqf";

//PVEH
"KOTH_onPlayerSave" addPublicVariableEventHandler
	{(_this select 1) spawn KOTH_playerSave};