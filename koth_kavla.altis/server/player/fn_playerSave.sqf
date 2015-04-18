/*
	File: fn_playerSave.sqf
	Author: BAROD
	Description:
		NONE
	Parameters:
		NONE
*/

[format["savePlayerData:%1:%2:%3:%4", (_this select 0), ([(_this select 1)] call KOTH_strip), (_this select 2), (_this select 3)], 2] call KOTH_asyncCall;