/*
	File: fn_MPupdate.sqf
	Author: BAROD

	Description:
		update MP PLayer id etc
	Parameters:
		0: unit: Object
*/

private ["_clientID"];

_clientID = _this select 0;

[_clientID] call KOTH_fnc_handlersSetup;