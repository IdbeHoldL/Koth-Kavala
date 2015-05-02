/*
	File: fn_playerLevel.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/
private ["_xp","_deaths","_kills","_stats","_level","_nextRank"];

_stats = missionNamespace getVariable "player_stats";
_level = (_stats select 0);
_kills = (_stats select 1);
_deaths = (_stats select 2);
_xp = (_stats select 3);

_xp = _xp + (_this select 0);
_deaths = _deaths + (_this select 1);
_kills = _kills + (_this select 2);

_nextRank = 0;
_nextRank = (_stats select 0) * ( (_stats select 0) - 1) * 500;    
if(_nextRank < 1) then {_nextRank = 500;};

if( _xp >= _nextRank ) then {
	_xp = _nextRank - _xp;
	_level = _level + 1;
	if(_xp < 0) then{_xp = 0;};
	missionNamespace setVariable ["player_stats",[_level,_kills,_deaths,_xp]];
}else{
	missionNamespace setVariable ["player_stats",[_level,_kills,_deaths,_xp]];
};