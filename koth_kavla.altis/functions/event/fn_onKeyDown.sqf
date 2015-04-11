/*
	File: fn_onKeyDown.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private [ "_display", "_code", "_shift", "_ctrl", "_alt", "_handled" ];
_display = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_handled = false;

switch (true) do {
	case ( _code in actionKeys "ForceCommandingMode" ): {
		_handled = true;
	};
	
	case (_code in actionKeys "TacticalView" ): {
		_handled = true;
	};

	case (_code in actionKeys "SelectAll"): {
		_handled = true;
	};
	
	case ( _code in actionKeys "ShowMap" ): {
		if !( visibleMap ) then {
			[] spawn koth_fnc_playerMarkers;
		};
	};

};

switch (_code) do {
	//U
	case 22 : {
		([] call BIS_fnc_displayMission) createDisplay "RscDisplayDynamicGroups";
    };
	//F1
	case 59 : {
		koth_soundLevel = !koth_soundLevel;
		if (koth_soundLevel) then {
			1 fadeSound 0.1; 
			0 = ["<t size = '0.8' shadow = '0' color = '#99ffffff'>Sound off</t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
		} else {
			1 fadeSound 1;
			0 = ["<t size = '0.8' shadow = '0' color = '#99ffffff'>Sound on</t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
		};
		_handled = true;
    };
};

_handled;