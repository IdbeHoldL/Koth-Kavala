/*
	File: fn_playerSave.sqf
	Author: BAROD
	Description:
		NONE
	Parameters:
		NONE
*/

[format["savePlayerData:%1:%2:%3:%4", (_this select 0), ([(_this select 1)] call BAROD_fnc_strip), (_this select 2), (_this select 3)]] call BAROD_fnc_async;