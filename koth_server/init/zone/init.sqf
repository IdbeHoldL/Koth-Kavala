createMarker ["OBJECTIVE", getMarkerPos "objective_main"];
"OBJECTIVE" setMarkerShape "ELLIPSE";
"OBJECTIVE" setMarkerSize [400, 400];
"OBJECTIVE" setMarkerBrush "Solid";
"OBJECTIVE" setMarkerColor "ColorBlack";
"OBJECTIVE" setMarkerAlpha 0.5;

createMarker ["OBJECTIVEINNER", getMarkerPos "objective_main"];
"OBJECTIVEINNER" setMarkerShape "ELLIPSE";
"OBJECTIVEINNER" setMarkerSize [80, 80];
"OBJECTIVEINNER" setMarkerBrush "Solid";
"OBJECTIVEINNER" setMarkerColor "ColorBlack";
"OBJECTIVEINNER" setMarkerAlpha 0.6;

for "_i" from 1 to 7 do {
	_name = format["TOWER%1", _i];
	createMarker [_name, getMarkerPos format ["tower_%1", _i]; //todo pos multi town etc
	_name setMarkerShape "ELLIPSE";
	_name setMarkerSize [10, 10];
	_name setMarkerBrush "Solid";
	_name setMarkerColor "ColorPink";
	_name setMarkerAlpha 0.6;
};

[] call compile preprocessfilelinenumbers "koth_server\init\zone\update.sqf";