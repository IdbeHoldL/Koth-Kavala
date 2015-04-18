/*
	File: init.sqf
	Author: BAROD
	
	Description:
		Executed when mission is started (before briefing screen)
	Parameters:
		NONE
*/
enableSaving [false,false];
enableSentences false;

if (isServer) then {
	[] execVM "functions\server\init\server_init.sqf";
};