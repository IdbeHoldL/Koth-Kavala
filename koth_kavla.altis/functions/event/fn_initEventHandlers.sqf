/*
	File: fn_initEventHandlers.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

player addEventHandler["Respawn",{_this call KOTH_fnc_onRespawn}];

//Keys event handlers
(findDisplay 46) displayAddEventHandler["KeyDown",KOTH_fnc_onKeyDown];