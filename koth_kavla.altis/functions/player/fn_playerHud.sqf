/*
	File: fn_playerHud.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

while {true} do {
	uiSleep 3;
	if (isNull (uiNamespace getvariable ["statsDisplay",displayNull])) then {	
        cutRsc ["statsScreen", "PLAIN"];      
        with uiNamespace do {
            statsxp = statsDisplay displayCtrl 1000;
			statskills = statsDisplay displayCtrl 1001;
			statsblu = statsDisplay displayCtrl 1002;
			statsred = statsDisplay displayCtrl 1003;
			statsind = statsDisplay displayCtrl 1004;
        };
    };
    
	_ticket = missionNamespace getVariable "ticket_stats";	
	uiNamespace setVariable ['tickets_west', floor (_ticket select 0 / 3)];
	uiNamespace setVariable ['tickets_east', floor (_ticket select 1 / 3)];
	uiNamespace setVariable ['tickets_indep', floor (_ticket select 2 / 3)];
	
	_stats = missionNamespace getVariable "player_stats";	
	_nextRank = 0;
	_nextRank = (_stats select 0) * ( (_stats select 0) - 1) * 500;    
	if(_nextRank < 1) then {_nextRank = 500;};
	
	uiNamespace setVariable ['playerrank', (_stats select 0)];
	uiNamespace setVariable ['playerkills', (_stats select 1)];
	uiNamespace setVariable ['playerdeaths', (_stats select 2)];
	uiNamespace setVariable ['playerxp', (_stats select 3)];
	uiNamespace setVariable ['playernextrank',  _nextRank];
	
    with uiNamespace do {
		_output = format ["Rank: %1   XP: %2/%3", playerrank, playerxp, playernextrank];
        statsxp ctrlSetText _output;
        statsxp ctrlCommit 0.1; 
		
		_output = format ["Kills: %1   Deaths: %2", playerkills, playerdeaths];
		statskills ctrlSetText _output;
        statskills ctrlCommit 0.1; 
		
		statsblu ctrlSetText str tickets_west;
        statsblu ctrlCommit 0.1; 
	
		statsred ctrlSetText str tickets_east;
        statsred ctrlCommit 0.1; 
		
		statsind ctrlSetText str tickets_indep;
        statsind ctrlCommit 0.1; 
    };
};