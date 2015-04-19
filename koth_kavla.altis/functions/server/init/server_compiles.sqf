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
KOTH_loadConfig = compileFinal preprocessFileLineNumbers "functions\server\init\server_config.sqf";

//Player
KOTH_playerSave = compileFinal preprocessFileLineNumbers "functions\server\player\fn_playerSave.sqf";
KOTH_playerLoad = compileFinal preprocessFileLineNumbers "functions\server\player\fn_playerLoad.sqf";

//PVEH
"KOTH_onPlayerSave" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn KOTH_playerSave};