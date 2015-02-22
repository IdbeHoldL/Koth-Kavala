/*
	File: fn_onKilled.sqf
	Author: BAROD

	Description:
		Trigger when client Dies.

	Parameters:
		0: unit: Object
		1: killer: Object
*/

_unit = _this select 0;
_killer = _this select 1;

if (isPlayer _unit && isPlayer _killer) then {
	if(_unit != _killer) then {
		if (_killer isKindOf "Man") then {
			if ((faction _unit) != (faction _killer)) then {
				player_stats_add = [100,1,0];
				owner _killer publicVariableClient "player_stats_add";
					
				player_stats_add = [0,0,1];
				owner _unit publicVariableClient "player_stats_add";
			};
		}
		else
		{
			player_stats_add = [100,1,0];
			_crew = crew _killer;
				
			{owner _x publicVariableClient "player_stats_add";} forEach _crew;
				
			player_stats_add = [0,0,1];
			owner _unit publicVariableClient "player_stats_add";
		};
	}
	else
	{
		player_stats_add = [0,0,1];
		owner _unit publicVariableClient "player_stats_add";
	};
}; 