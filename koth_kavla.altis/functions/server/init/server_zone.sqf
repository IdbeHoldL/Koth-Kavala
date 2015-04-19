/*
	File: server_marker.sqf
	Author: BAROD
	Description:
		NONE
	Parameters:
		NONE
*/

while {true} do {
	sleep 10;
	_allPlayers = playableUnits;

	_bluCount = 0;
	_redCount = 0;
	_indCount = 0;
	
	_count = (count _allPlayers) -1;
	
	for "_i" from 0 to _count do 
	{
		_unit = _allPlayers select _i;
		if(isPlayer _unit) then
		{
		_distance = _unit distance (getMarkerPos "objective_main");
	
		if (_distance < 400) then {
			[5,0,0] call KOTH_fnc_playerLevel;
			
			if(side _unit == west) then {
				_bluCount = _bluCount + 1;
				KOTH_tickets_west = KOTH_tickets_west + 0.1;
			};
			if(side _unit == east) then {
				_redCount = _redCount + 1;
				KOTH_tickets_east = KOTH_tickets_east + 0.1;
			};
			if(side _unit == resistance) then {
				_indCount = _indCount + 1;
				KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
			};
			
		};
		
		if (_distance < 80) then {
			[10,0,0] call KOTH_fnc_playerLevel;
			
			if(side _unit == west) then {
				_bluCount = _bluCount + 2;
				KOTH_tickets_west = KOTH_tickets_west + 0.1;
			};
			if(side _unit == east) then {
				_redCount = _redCount + 2;
				KOTH_tickets_east = KOTH_tickets_east + 0.1;
			};
			if(side _unit == resistance) then {
				_indCount = _indCount + 2;
				KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
			};
		};

			_distance = _unit distance (getMarkerPos "tower_1");
	
			if (_distance < 10) then
			{
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_2");
	
			if (_distance < 10) then
			{
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_3");
	
			if (_distance < 10) then {
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_4");
	
			if (_distance < 10) then
			{
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_5");
	
			if (_distance < 10) then
			{
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_6");
	
			if (_distance < 10) then {
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		
			_distance = _unit distance (getMarkerPos "tower_7");
	
			if (_distance < 10) then {
				[20,0,0] call KOTH_fnc_playerLevel;
			
				if(side _unit == west) then {
					_bluCount = _bluCount + 2;
					KOTH_tickets_west = KOTH_tickets_west + 0.1;
				};
				if(side _unit == east) then {
					_redCount = _redCount + 2;
					KOTH_tickets_east = KOTH_tickets_east + 0.1;
				};
				if(side _unit == resistance) then {
					_indCount = _indCount + 2;
					KOTH_tickets_ind = KOTH_tickets_ind + 0.1;
				};
			};
		};
	
	};
	
	if (_bluCount > _redCount && _bluCount > _indCount) then {
		KOTH_tickets_west = KOTH_tickets_west + 1;
		"OBJECTIVE" setMarkerColor "ColorBlue";
	}
	else
	{
		if (_redCount > _bluCount && _redCount > _indCount) then {
			KOTH_tickets_east = KOTH_tickets_east + 1;
			"OBJECTIVE" setMarkerColor "ColorRed";
		}
		else
		{
			if (_indCount > _bluCount && _indCount > _redCount) then {
				KOTH_tickets_ind = KOTH_tickets_ind + 1;
				"OBJECTIVE" setMarkerColor "ColorGreen";
			}
			else
			{
				"OBJECTIVE" setMarkerColor "ColorBlack";
			};
		};
	};

	publicVariable "KOTH_tickets_west";
	publicVariable "KOTH_tickets_east";
	publicVariable "KOTH_tickets_ind";
};