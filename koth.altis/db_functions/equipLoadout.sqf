if (isServer) then 
{
	_unit = _this select 0;
	_uid = getPlayerUID _unit;

	_result = [format["insertPlayerSave:%1", _uid], 2] call async;

	_ammo = _result select 0;
	_weapons = _result select 1;
	_items = _result select 2;
	_assignitems = _result select 3;
	_headgear = _result select 4;
	_goggles = _result select 5;
	_vest = _result select 6;
	_vestitems = _result select 7;
	_uniform = _result select 8;
	_uniformitems = _result select 9;
	_backpack = _result select 10;
	_packitems = _result select 11;
	_handgunitems = _result select 12;
	_primarywep = _result select 13;
	_secondarywep = _result select 14;

	player_equip = [_ammo, _weapons, _items, _assignitems, _headgear, _goggles, _vest, _vestitems, _uniform, _uniformitems, _backpack,
	_packitems, _handgunitems, _primarywep, _secondarywep];
	
	owner _unit publicVariableClient "player_equip";
};
    
