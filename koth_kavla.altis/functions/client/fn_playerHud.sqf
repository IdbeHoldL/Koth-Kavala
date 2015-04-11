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
    
	uiNamespace setVariable ['tickets_west', floor (0 / 3)];
	uiNamespace setVariable ['tickets_east', floor (0 / 3)];
	uiNamespace setVariable ['tickets_indep', floor (0 / 3)];
	uiNamespace setVariable ['player_xp', 0];
	
	uiNamespace setVariable ['playerrank', 0];
	uiNamespace setVariable ['playernextrank', 0];
	uiNamespace setVariable ['playerkills', 0];
	uiNamespace setVariable ['playerdeaths', 0];
	
    with uiNamespace do {
		_output = format ["Rank: %1   XP: %2/%3", 0, 0, 0];
        statsxp ctrlSetText _output;
        statsxp ctrlCommit 0.1; 
		
		_output = format ["Kills: %1   Deaths: %2", 0, 0];
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
