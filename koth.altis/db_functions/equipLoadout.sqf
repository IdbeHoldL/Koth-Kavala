if (isServer) then 
{
	_unit = _this select 0;
	_uid = getPlayerUID _unit;

	_result = [format["insertPlayerSave:%1", _uid], 2] call async;

	player_equip = [];
	
	player_equip = player_equip + _result;

	owner _unit publicVariableClient "player_equip";
};
    
