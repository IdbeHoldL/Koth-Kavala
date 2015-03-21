/*
	File: fn_handlersKilled.sqf
	Author: BAROD

	Description:
		Sends PV to server to signal player killed
	Parameters:
		0: unit: Object
*/

if (isDedicated) exitWith {};

client_onPlayerKilled = _this;
publicvariableServer "client_onPlayerKilled";