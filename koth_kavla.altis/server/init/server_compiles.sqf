/*
	File: server_compiles.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

//extdb
KOTH_asyncCall = compileFinal preprocessFileLineNumbers "server\extdb\fn_async.sqf";
KOTH_extdb = compileFinal preprocessFileLineNumbers "server\extdb\fn_extdb.sqf";
KOTH_strip = compileFinal preprocessFileLineNumbers "server\extdb\fn_strip.sqf";

//Player
KOTH_playerSave = compileFinal preprocessFileLineNumbers "server\player\fn_playerSave.sqf";
KOTH_playerLoad = compileFinal preprocessFileLineNumbers "server\player\fn_playerLoad.sqf";

//PVEH
"KOTH_onPlayerSave" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn KOTH_playerSave};