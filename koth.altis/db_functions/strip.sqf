_string = (_this select 0);

_array = toArray _string;
{
	if (_x == 58) then
	{
		_array set[_forEachIndex, -1];
	};
} foreach _array;
_array = _array - [-1];
_string = toString _array;
_string