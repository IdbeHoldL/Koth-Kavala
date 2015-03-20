/*
	File: initServer.sqf
	Author: BAROD
	
	Description:
		Executed only on server when mission is started.
	Parameters:
		NONE
*/

//Override BIS_fnc_MP packet EH
"BIS_fnc_MP_packet" addPublicVariableEventHandler { _this call KOTH_fnc_MPexec };
[] execVM "\koth_server\init\init_server.sqf";
