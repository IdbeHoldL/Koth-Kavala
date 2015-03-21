/*




*/

_player = _this select 0;
_uid = getPlayerUID _player;

_result = [format["insertPlayerSave:%1", _uid], 2] call HIVE_fnc_async;

player_equip = [];

player_equip = player_equip + _result;

owner _player publicVariableClient "player_equip";