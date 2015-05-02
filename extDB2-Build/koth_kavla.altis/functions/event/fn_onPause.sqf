/*
	File: fn_onPause.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

with missionNamespace do {
	private ["_display","_respawn","_manual","_abort","_title"];
	
	disableSerialization;
	_display = _this select 0;
	_respawn = _display displayCtrl 1010;
	_manual = _display displayCtrl 122;
	_abort = _display displayCtrl 104;
	_title = _display displayCtrl 1050;

	uiNamespace setVariable [ "InterruptDisplay", _display ];
	
	_abort ctrlSetEventHandler [ "ButtonClick", "with missionNamespace do { [] spawn KOTH_fnc_PlayerSave; disableUserInput true; [""Abort""] call BIS_fnc_endMission; }; ( uiNamespace getVariable ""InterruptDisplay"" ) closeDisplay 2; true" ];
	_manual ctrlEnable false;
};

true;