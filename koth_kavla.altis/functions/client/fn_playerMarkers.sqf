/*
	File: fn_playerMarkers.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_markers","_players"];
_markers = [];
_players = [];

sleep 5;

if(visibleMap) then {
    {	
		if (side group _x isEqualto playerSide && {alive _x}) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", name _x]; 	
			_markers pushback [_marker,_x];    
		};
	} foreach allUnits;
    while {visibleMap} do {
        {
            private["_marker","_unit"];
            _marker = _x select 0;
            _unit = _x select 1;
            if(!isNil "_unit") then
            {
                if(!isNull _unit) then
                {
                    _marker setMarkerPosLocal (visiblePosition _unit);
                };
            };
        } foreach _markers;
        if(!visibleMap) exitWith {};
        sleep 0.02;
    };

    {deleteMarkerLocal (_x select 0);} foreach _markers;
    _markers = [];
    _players = [];
};