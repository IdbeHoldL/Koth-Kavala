/*
	File: fn_playerHud.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

while {true} do {
	if (isNull (uiNamespace getvariable ["statsDisplay",displayNull])) then {	
        cutRsc ["statsScreen", "PLAIN"];      
        with uiNamespace do {
			statsblu = statsDisplay displayCtrl 1001;
			statsred = statsDisplay displayCtrl 1002;
			statsind = statsDisplay displayCtrl 1003;
			
			statprogress = statsDisplay displayCtrl 1004;
			statprogresstext = statsDisplay displayCtrl 1007;
           
			statlevel = statsDisplay displayCtrl 1005;
			statskills = statsDisplay displayCtrl 1006;
        };
    };
    
	uiNamespace setVariable ['tickets_west', floor (KOTH_tickets_west / 3)];
	uiNamespace setVariable ['tickets_east', floor (KOTH_tickets_east / 3)];
	uiNamespace setVariable ['tickets_indep', floor (KOTH_tickets_ind / 3)];
	
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
		_output = format ["XP: %1/%2", [playerxp] call BIS_fnc_numberText, [playernextrank] call BIS_fnc_numberText];
        statprogresstext ctrlSetText _output;
		statprogress ctrlCommit 0.1; 
		
		statprogress progressSetPosition (playerxp / playernextrank);

		_output = format ["%1", playerrank];
        statlevel ctrlSetText _output;	
		statlevel ctrlCommit 0.1; 
		
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
	uiSleep 3;
};