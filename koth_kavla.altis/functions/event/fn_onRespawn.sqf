/*
	File: fn_onRespawn.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private [ "_unit", "_corpse" ];
_unit = _this select 0;
_corpse = _this select 1;

[] call KOTH_fnc_playerLoadout;

player addRating 99999999;
player addScore 99999999;